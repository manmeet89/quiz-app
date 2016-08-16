/**
 *
 */
package com.fil.quiz.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.json.JSONObject;
import org.postgresql.util.PGobject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.fil.quiz.vo.AnswersVO;
import com.fil.quiz.vo.ResponseVO;
import com.fil.quiz.vo.ResultVO;
import com.google.gson.Gson;

/**
 * @author ManmeetFIL
 *
 */
@Repository
public class GenericDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public String getSystemParameter(String paramName) {
		return jdbcTemplate.queryForObject("SELECT PARAM_VALUE from SYS_PARAM WHERE PARAM_NAME = ?", new Object[] { paramName },
				String.class);
	}

	public int updateActiveSet(String setName) {
		return jdbcTemplate.update("update SYS_PARAM set PARAM_VALUE = ? where PARAM_NAME = 'ACTIVE_SET'", new Object[] { setName });
	}

	public int clearOldResponses() {
		return jdbcTemplate.update("update QUIZ_RESPONSE set IS_ARCHIVED = ? where RESPONSE_TIME < now()", new Object[] { true });
	}

	public Boolean checkIfResponseAlreadyExists(String aNumber, String set) {
		int count = jdbcTemplate.queryForObject("SELECT count(*) from QUIZ_RESPONSE WHERE ANUMBER = ? AND SET_NAME = ? AND IS_ARCHIVED = ?",
				new Object[] { aNumber.toUpperCase(), set, false }, Integer.class);
		return count > 0 ? true : false;
	}

	public Boolean checkIfEmailAlreadySent(String aNumber) {
		int count = jdbcTemplate.queryForObject("SELECT count(*) from QUIZ_RESPONSE WHERE ANUMBER = ? AND EMAIL_SENT = ?",
				new Object[] { aNumber.toUpperCase(), true }, Integer.class);
		return count > 0 ? true : false;
	}

	public String saveResponse(ResponseVO response) throws SQLException {
		TimeZone.setDefault(TimeZone.getTimeZone("IST"));
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("answers", response.getAnswers());
		PGobject pg = new PGobject();
		pg.setType("json");
		pg.setValue(jsonObj.toString());
		jdbcTemplate.update(
				"INSERT INTO QUIZ_RESPONSE(ANUMBER, ANSWERS, SCORE, SET_NAME, RESPONSE_TIME, IS_ARCHIVED, EMAIL_SENT) VALUES(?, to_json(?::json)::jsonb, ?, ?, ?, ?, ?)",
				(PreparedStatementSetter) ps -> {
					ps.setString(1, response.getaNumber().toUpperCase());
					ps.setObject(2, pg);
					ps.setInt(3, response.getScore());
					ps.setString(4, response.getSet());
					ps.setTimestamp(5, new Timestamp(new Date().getTime()));
					ps.setBoolean(6, false);
					ps.setBoolean(7, true);
				});
		return "success";
	}

	public AnswersVO getSetAnswers(String setName) {
		PGobject obj = jdbcTemplate.queryForObject("SELECT ANSWERS from SET_ANSWERS WHERE SET_NAME = ?", new Object[] { setName },
				PGobject.class);
		Gson gson = new Gson();
		AnswersVO answer = gson.fromJson(obj.getValue(), AnswersVO.class);
		return answer;
	}

	public Map<String, AnswersVO> getAllSetAnswers() {
		Map<String, AnswersVO> map = new HashMap<>();
		jdbcTemplate.query("SELECT * from SET_ANSWERS", (RowMapper) (rs, arg1) -> {
			Gson gson = new Gson();
			AnswersVO answer = gson.fromJson(rs.getString("ANSWERS"), AnswersVO.class);
			map.put(rs.getString("SET_NAME"), answer);
			return answer;
		});
		return map;
	}

	public List<ResultVO> getResults() {
		return jdbcTemplate.query("select * from QUIZ_RESPONSE WHERE IS_ARCHIVED = ? ORDER BY SET_NAME, SCORE desc, response_time asc",
				new Object[] { false }, (RowMapper) (rs, arg1) -> {
					ResultVO r = new ResultVO();
					r.setaNumber(rs.getString("ANUMBER"));
					r.setSet(rs.getString("SET_NAME"));
					r.setScore(rs.getInt("SCORE"));
					r.setTimSubmitted(rs.getTimestamp("RESPONSE_TIME"));
					Gson gson = new Gson();
					AnswersVO answer = gson.fromJson(rs.getString("ANSWERS"), AnswersVO.class);
					r.setAnswersVO(answer);
					return r;
				});
	}
}
