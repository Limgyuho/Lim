//package com.koreaIT.demo.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import com.koreaIT.demo.service.CalendarService;
//
//@Controller
//public class CalendarController {
//
//  @Autowired
//  private CalendarService calendarService;
//
//  @GetMapping("/calendar")
//  public String calendarPage(Model model) {
//    List<Event> events = calendarService.getAllEvents();
//    model.addAttribute("events", events);
//    return "calendar";
//  }
//
//  @PostMapping("/calendar/add")
//  public String addEvent(@ModelAttribute Event event) {
//    calendarService.addEvent(event);
//    return "redirect:/calendar";
//  }
//
//  @PostMapping("/calendar/update")
//  public String updateEvent(@ModelAttribute Event event) {
//    calendarService.updateEvent(event);
//    return "redirect:/calendar";
//  }
//
//  @GetMapping("/calendar/delete/{eventId}")
//  public String deleteEvent(@PathVariable int eventId) {
//    calendarService.deleteEvent(eventId);
//    return "redirect:/calendar";
//  }
//}
//
