package com.DetroitLabs.TacoLoco.controller;


import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.DetroitLabs.TacoLoco.model.Bill;
import com.DetroitLabs.TacoLoco.model.Process;

@Controller
@RequestMapping("/total")
public class OrderController {
	
	  @RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE) 
	  public @ResponseBody Bill CalculateOrderTotalArray(@RequestBody Process process) { 
		  //Initiating the bill model to process then incoming instance of order Bill bill = new Bill();
		  System.out.println("Total Order Cost:"); 

		  Bill bill = new Bill();
		  try{ 
		  bill=bill.calculateTotal(process.getOrder());
	  System.out.println("Total Order Cost:" + bill.getTotal()); 
	  } catch(Exception
	  ex) { 
		  System.out.println("Something went wrong:" + ex.getMessage()); } 
		  return bill; 
		  }
	 
}
