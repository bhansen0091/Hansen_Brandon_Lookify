package com.hansen.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hansen.lookify.models.Song;

public interface SongRepository extends CrudRepository<Song, Long> {
	
	List<Song> findAll();
	
	// this method finds books with descriptions containing the search string
	List<Song> findByArtistContaining(String artist);
	
}
