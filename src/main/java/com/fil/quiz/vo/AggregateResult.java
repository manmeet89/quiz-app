/**
 *
 */
package com.fil.quiz.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ManmeetFIL
 *
 */
public class AggregateResult {

	List<ResultVO> setAResults;

	List<ResultVO> setBResults;

	List<ResultVO> setCResults;

	public AggregateResult() {
		setAResults = new ArrayList<>();
		setBResults = new ArrayList<>();
		setCResults = new ArrayList<>();
	}

	/**
	 * @return the setAResults
	 */
	public List<ResultVO> getSetAResults() {
		return setAResults;
	}

	/**
	 * @param setAResults
	 *            the setAResults to set
	 */
	public void setSetAResults(List<ResultVO> setAResults) {
		this.setAResults = setAResults;
	}

	/**
	 * @return the setBResults
	 */
	public List<ResultVO> getSetBResults() {
		return setBResults;
	}

	/**
	 * @param setBResults
	 *            the setBResults to set
	 */
	public void setSetBResults(List<ResultVO> setBResults) {
		this.setBResults = setBResults;
	}

	/**
	 * @return the setCResults
	 */
	public List<ResultVO> getSetCResults() {
		return setCResults;
	}

	/**
	 * @param setCResults
	 *            the setCResults to set
	 */
	public void setSetCResults(List<ResultVO> setCResults) {
		this.setCResults = setCResults;
	}
}
