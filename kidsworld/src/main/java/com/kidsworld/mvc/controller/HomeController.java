package com.kidsworld.mvc.controller;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.service.CommunityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.inject.Inject;

@Controller
public class HomeController {

	@Inject
	CommunityService cs;

	@GetMapping("/")
	public String home(Criteria cri, Model model) throws Exception {
		cri.setPerPageNum(5);
		model.addAttribute("notice", cs.noticeList(cri));
		model.addAttribute("qna", cs.qnaList(cri));
		model.addAttribute("review", cs.reviewListBest(cri));
		return "main";

	}

	@GetMapping("info")
	public String info() {
		return "info";
	}

	@GetMapping("bexco")
	public String branchBexco() {
		return "branch/bexco";
	}

	@GetMapping("exco")
	public String branchExco() {
		return "branch/exco";
	}

	@GetMapping("kintex")
	public String branchKintex() {
		return "branch/kintex";
	}

	@GetMapping("business")
	public String business() {
		return "business";
	}

	@GetMapping("event")
	public String event() {
		return "event";
	}
}
