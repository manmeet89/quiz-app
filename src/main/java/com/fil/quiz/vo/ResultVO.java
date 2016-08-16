/**
 *
 */
package com.fil.quiz.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author ManmeetFIL
 *
 */
public class ResultVO {

	String aNumber;

	String set;

	Integer score;

	Date timSubmitted;

	List<QAnswerVO> qAnswers;

	AnswersVO answersVO;

	public ResultVO() {
		this.qAnswers = new ArrayList<QAnswerVO>();
	}

	/**
	 * @return the aNumber
	 */
	public String getaNumber() {
		return aNumber;
	}

	/**
	 * @param aNumber
	 *            the aNumber to set
	 */
	public void setaNumber(String aNumber) {
		this.aNumber = aNumber;
	}

	/**
	 * @return the set
	 */
	public String getSet() {
		return set;
	}

	/**
	 * @param set
	 *            the set to set
	 */
	public void setSet(String set) {
		this.set = set;
	}

	/**
	 * @return the score
	 */
	public Integer getScore() {
		return score;
	}

	/**
	 * @param score
	 *            the score to set
	 */
	public void setScore(Integer score) {
		this.score = score;
	}

	/**
	 * @return the timSubmitted
	 */
	public Date getTimSubmitted() {
		return timSubmitted;
	}

	/**
	 * @param timSubmitted
	 *            the timSubmitted to set
	 */
	public void setTimSubmitted(Date timSubmitted) {
		this.timSubmitted = timSubmitted;
	}

	/**
	 * @return the qAnswers
	 */
	public List<QAnswerVO> getqAnswers() {
		return qAnswers;
	}

	/**
	 * @param qAnswers
	 *            the qAnswers to set
	 */
	public void setqAnswers(List<QAnswerVO> qAnswers) {
		this.qAnswers = qAnswers;
	}

	/**
	 * @return the answersVO
	 */
	public AnswersVO getAnswersVO() {
		return answersVO;
	}

	/**
	 * @param answersVO
	 *            the answersVO to set
	 */
	public void setAnswersVO(AnswersVO answersVO) {
		this.answersVO = answersVO;
	}
}
