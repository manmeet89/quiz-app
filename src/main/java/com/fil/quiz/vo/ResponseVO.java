/**
 *
 */
package com.fil.quiz.vo;

import java.util.List;

/**
 * @author ManmeetFIL
 *
 */
public class ResponseVO {

	String aNumber;

	String set;

	List<String> answers;

	Integer score;

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
	 * @return the answers
	 */
	public List<String> getAnswers() {
		return answers;
	}

	/**
	 * @param answers
	 *            the answers to set
	 */
	public void setAnswers(List<String> answers) {
		this.answers = answers;
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
}
