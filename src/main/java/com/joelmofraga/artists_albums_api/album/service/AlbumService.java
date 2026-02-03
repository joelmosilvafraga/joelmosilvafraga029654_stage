package com.joelmofraga.artists_albums_api.album.service;

import com.joelmofraga.artists_albums_api.album.domain.Album;
import com.joelmofraga.artists_albums_api.album.dto.AlbumCreateRequest;
import com.joelmofraga.artists_albums_api.album.dto.AlbumResponse;
import com.joelmofraga.artists_albums_api.album.repository.AlbumRepository;
import com.joelmofraga.artists_albums_api.albumtype.domain.AlbumType;
import  com.joelmofraga.artists_albums_api.album.repository.AlbumTypeRepository; // ✅ pacote correto
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class AlbumService {

    private final AlbumRepository albumRepository;
    private final AlbumTypeRepository albumTypeRepository;

    public AlbumService(AlbumRepository albumRepository, AlbumTypeRepository albumTypeRepository) {
        this.albumRepository = albumRepository;
        this.albumTypeRepository = albumTypeRepository;
    }

    @Transactional
    public AlbumResponse create(AlbumCreateRequest request) {
        AlbumType type = albumTypeRepository.findByCodeIgnoreCase(request.getAlbumTypeCode().trim())
                .filter(AlbumType::getActive)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.BAD_REQUEST,
                        "Invalid albumTypeCode: " + request.getAlbumTypeCode()
                ));

        Album album = new Album();
        album.setTitle(request.getTitle().trim());
        album.setReleaseYear(request.getReleaseYear());
        album.setGenre(request.getGenre() != null ? request.getGenre().trim() : null);
        album.setAlbumType(type);

        Album saved = albumRepository.save(album);
        return toResponse(saved);
    }

    @Transactional(readOnly = true)
    public AlbumResponse getByTitle(String title) {
        if (title == null || title.trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "title is required");
        }

        Album album = albumRepository.findFirstByTitleIgnoreCase(title.trim())
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND,
                        "Album not found for title: " + title
                ));

        return toResponse(album);
    }

    @Transactional(readOnly = true)
    public List<AlbumResponse> getAlbumsByArtistName(String artistName) {
        if (artistName == null || artistName.isBlank()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "name is required");
        }

        var albums = albumRepository.findAlbumsByArtistNameIgnoreCase(artistName.trim());

        return albums.stream()
                .map(this::toResponse) // ✅ usa o mapper que já existe
                .toList();
    }

    private AlbumResponse toResponse(Album a) {
        return new AlbumResponse(
                a.getId(),
                a.getTitle(),
                a.getReleaseYear(),
                a.getGenre(),
                a.getAlbumType().getCode(),
                a.getAlbumType().getDescription(),
                a.getCreatedAt(),
                a.getUpdatedAt()
        );
    }
}
