/**
 *
 */
package com.fil.quiz.vo;

/**
 * @author ManmeetFIL
 *
 */
public class QAnswerVO {

	String answerSelected;

	Boolean isCorrect;

	public QAnswerVO() {
	}

	public QAnswerVO(String answerSelected, Boolean isCorrect) {
		this.answerSelected = answerSelected;
		this.isCorrect = isCorrect;
	}

	/**
	 * @return the answerSelected
	 */
	public String getAnswerSelected() {
		return answerSelected;
	}

	/**
	 * @param answerSelected
	 *            the answerSelected to set
	 */
	public void setAnswerSelected(String answerSelected) {
		this.answerSelected = answerSelected;
	}

	/**
	 * @return the isCorrect
	 */
	public Boolean getIsCorrect() {
		return isCorrect;
	}

	/**
	 * @param isCorrect
	 *            the isCorrect to set
	 */
	public void setIsCorrect(Boolean isCorrect) {
		this.isCorrect = isCorrect;
	}
}
