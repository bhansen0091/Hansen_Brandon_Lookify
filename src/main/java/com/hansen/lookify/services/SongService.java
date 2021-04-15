package com.hansen.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.hansen.lookify.models.Song;
import com.hansen.lookify.repositories.SongRepository;

@Service
public class SongService {

	private final SongRepository sRepo;
	
	public SongService(SongRepository songRepo) {
		this.sRepo = songRepo;
	}
	
	public List<Song> getAllSongs() {
		return this.sRepo.findAll();
	}
	
	public List<Song> findSongByArtist(String artist) {
		return this.sRepo.findByArtistContaining(artist);
	}
	
	public Song createSong(Song song) {
		return this.sRepo.save(song);
	}
	
	public Song getById(Long id) {
		Optional<Song> optionalSong = this.sRepo.findById(id);
		if (optionalSong.isPresent()) {
			return optionalSong.get();
		}
		return null;
	}
	
	public void delete(Long id) {
		this.sRepo.deleteById(id);
	}
	
}
