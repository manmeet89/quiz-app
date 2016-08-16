/**
 *
 */
package com.fil.quiz.vo;

import java.util.List;

/**
 * @author ManmeetFIL
 *
 */
public class QuizResults {

	String set;

	List<ResultVO> results;

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
	 * @return the results
	 */
	public List<ResultVO> getResults() {
		return results;
	}

	/**
	 * @param results
	 *            the results to set
	 */
	public void setResults(List<ResultVO> results) {
		this.results = results;
	}
}
