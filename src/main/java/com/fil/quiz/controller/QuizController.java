/**
 *
 */
package com.fil.quiz.controller;
/**
 * @author ManmeetFIL
 *
 */

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fil.quiz.dao.GenericDAO;
import com.fil.quiz.helper.EmailHelper;
import com.fil.quiz.vo.AggregateResult;
import com.fil.quiz.vo.AnswersVO;
import com.fil.quiz.vo.QAnswerVO;
import com.fil.quiz.vo.ResponseVO;
import com.fil.quiz.vo.ResultVO;

/**
 * The Class EchoController. This is the front end controller for handling the
 * request for the Echo service. It contains APIs for the public and protected
 * services.
 *
 *
 * @author ManmeetFIL
 */
@Controller(value = "")
public class QuizController {

	@Autowired
	GenericDAO genericDAO;

	@Autowired
	EmailHelper emailHelper;

	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(QuizController.class);

	@RequestMapping(value = "/")
	public String startTest(ModelMap map) {
		map.addAttribute("set", genericDAO.getSystemParameter("ACTIVE_SET"));
		return "quizSet";
	}

	@RequestMapping(value = "/admin")
	public String admin(ModelMap map) {
		map.addAttribute("set", genericDAO.getSystemParameter("ACTIVE_SET"));
		return "admin";
	}

	@RequestMapping(value = "/updateSet", method = RequestMethod.POST)
	public @ResponseBody String updateSet(@RequestParam String setName) {
		if (StringUtils.isEmpty(setName)) {
			return "error";
		}
		genericDAO.updateActiveSet(setName);
		return "success";
	}

	@RequestMapping(value = "/clearResponses")
	public @ResponseBody String clearResponses() {
		genericDAO.clearOldResponses();
		return "success";
	}

	@RequestMapping(value = "/quizResults")
	public String quizResults(ModelMap map) {
		List<ResultVO> totalResults = getTotalResult();
		map.addAttribute("results", getAgregateResult(totalResults));
		return "quizResults";
	}

	@RequestMapping(value = "/submitQuiz", method = RequestMethod.POST)
	public @ResponseBody String submitQuiz(@RequestBody ResponseVO response) throws SQLException, IOException {
		if (genericDAO.checkIfResponseAlreadyExists(response.getaNumber(), response.getSet())) {
			return "duplicate";
		}
		setScore(response);
		if (!genericDAO.checkIfEmailAlreadySent(response.getaNumber())) {
			try {
				emailHelper.sendEmail(response.getaNumber());
			} catch (UnsupportedEncodingException e) {
				System.err.println("Email was NOT SENT !! - " + e);
			}
		}
		genericDAO.saveResponse(response);
		return "success";
	}

	@RequestMapping(value = "/testEmail")
	public @ResponseBody String testEmail() {
		try {
			emailHelper.sendEmail("A516756");
		} catch (UnsupportedEncodingException e) {
			System.err.println("Exception occurred ::" + e);
		}
		return "success";
	}

	private void setScore(ResponseVO responseVO) {
		Integer score = 0;
		AnswersVO answers = genericDAO.getSetAnswers(responseVO.getSet());
		for (int i = 0; i < responseVO.getAnswers().size(); i++) {
			if (responseVO.getAnswers().get(i).equalsIgnoreCase(answers.getAnswers().get(i))) {
				score++;
			}
		}
		responseVO.setScore(score);
	}

	private List<ResultVO> getTotalResult() {
		List<ResultVO> results = genericDAO.getResults();
		setIfAnswerIsCorrect(results, genericDAO.getAllSetAnswers());
		return results;
	}

	private void setIfAnswerIsCorrect(List<ResultVO> results, Map<String, AnswersVO> answersMap) {
		for (ResultVO r : results) {
			AnswersVO correctAnswers = answersMap.get(r.getSet());
			List<String> answersCorrect = correctAnswers.getAnswers();
			List<String> answersSelected = r.getAnswersVO().getAnswers();
			for (int i = 0; i < answersSelected.size(); i++) {
				QAnswerVO qAnswerVO = new QAnswerVO(answersSelected.get(i), answersSelected.get(i).equalsIgnoreCase(answersCorrect.get(i)));
				r.getqAnswers().add(qAnswerVO);
			}
		}
	}

	private AggregateResult getAgregateResult(List<ResultVO> totalResults) {
		AggregateResult a = new AggregateResult();
		for (ResultVO r : totalResults) {
			if (r.getSet().equalsIgnoreCase("SET 1")) {
				a.getSetAResults().add(r);
			}
			if (r.getSet().equalsIgnoreCase("SET 2")) {
				a.getSetBResults().add(r);
			}
			if (r.getSet().equalsIgnoreCase("SET 3")) {
				a.getSetCResults().add(r);
			}
		}
		return a;
	}
}
