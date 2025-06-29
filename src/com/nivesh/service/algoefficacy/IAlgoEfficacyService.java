package com.nivesh.service.algoefficacy;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.nivesh.command.algoefficacy.AlgoEfficacyCommand;

public interface IAlgoEfficacyService {

	Map findAlgoEfficacy(AlgoEfficacyCommand efficacyCommand) throws ParseException;

}
