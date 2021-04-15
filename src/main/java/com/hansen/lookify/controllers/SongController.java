package com.hansen.lookify.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hansen.lookify.models.Song;
import com.hansen.lookify.services.SongService;




@Controller
public class SongController {

	private final SongService sService;
	
	public SongController(SongService sService) {
		this.sService = sService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model viewModel) {
		viewModel.addAttribute("allSongs", this.sService.getAllSongs());		
		return "dashboard.jsp";
	}
	
	@RequestMapping("/songs/new")
	public String addSong(@ModelAttribute("song") Song song) {
		return "create.jsp";
	}
	
	@RequestMapping(value = "/songs/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("song") Song song,
			BindingResult result) {
		
		if (result.hasErrors()) {
			return "create.jsp";
		} else {
			this.sService.createSong(song);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("/search")
	public String searchSubmit(@RequestParam("artist") String artist) {
		return ("redirect:/search/" + artist);
	}
	
	@RequestMapping("/search/{artist}")
	public String searchedArtist(Model viewModel, @PathVariable("artist") String artist) {
		viewModel.addAttribute("allSongs", this.sService.findSongByArtist(artist));
		return "searchedArtist.jsp";
	}
	

	@RequestMapping(value = "/songs/{id}")
	public String show(@PathVariable("id") Long id, Model viewModel) {
		Song sSong = this.sService.getById(id);
		viewModel.addAttribute("sSong", sSong);
		return "show.jsp";
	}
	
	@RequestMapping(value = "/songs/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		this.delete(id);
		return "redirect:/dashboard";
	}
	
	
}
