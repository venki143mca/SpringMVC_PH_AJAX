package com.qualcomm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import qcom.cas.commons.ph.Ph;
import qcom.cas.commons.ph.PhException;
import qcom.cas.commons.ph.PhService;

@Controller
public class HelloController {
	
	@Autowired
	PhService phService;

	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		return "hello";
	}
	@RequestMapping(value = "/{name:.+}", method = RequestMethod.GET)
	public ModelAndView passCode(@PathVariable("name") String name, @RequestHeader HttpHeaders headers) {
	*/
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView passCode(@RequestHeader HttpHeaders headers) {
	
		Ph ph;
		ModelAndView model = new ModelAndView();
		if( headers != null 
				&& headers.get("SM_USER") != null 
				&& !StringUtils.isEmpty(headers.get("SM_USER").size())
		) {
			String userId = (String) headers.get("SM_USER").get(0);
			try {
				ph = phService.findByUsername(userId);
				if(ph != null) {
					model.addObject("mail", ph.getQcADMailAcct());
					model.addObject("firstName", ph.getGivenName());
					model.addObject("lastName", ph.getSn());
					model.addObject("userName", userId);
				}
				else {
					model.setViewName("error");
					return model;
				}
			} catch (PhException e) {
				e.printStackTrace();
				return model;
			}
			
			model.setViewName("hello");
			return model;
		}
		else {
			model.setViewName("error");
			return model;
		}

	}
	
	@RequestMapping(value = "/mti/index/{name:.+}", method = RequestMethod.GET)
	public ModelAndView passCode(@PathVariable("name") String name, @RequestHeader HttpHeaders headers) {
	
		Ph ph;
		ModelAndView model = new ModelAndView();
		try {
			ph = phService.findByUsername(name);
			if (ph != null) {
				model.addObject("mail", ph.getQcADMailAcct());
				model.addObject("firstName", ph.getGivenName());
				model.addObject("lastName", ph.getSn());
				model.addObject("userName", name);
			} else {
				model.setViewName("error");
				return model;
			}
		} catch (PhException e) {
			e.printStackTrace();
			return model;
		}

		model.setViewName("hello");
		return model;

	}

}