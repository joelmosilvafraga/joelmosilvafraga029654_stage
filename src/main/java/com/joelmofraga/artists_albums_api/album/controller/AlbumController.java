package com.joelmofraga.artists_albums_api.album.controller;

import com.joelmofraga.artists_albums_api.album.dto.AlbumCreateRequest;
import com.joelmofraga.artists_albums_api.album.dto.AlbumResponse;
import com.joelmofraga.artists_albums_api.album.service.AlbumService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.List;

import static com.joelmofraga.artists_albums_api.config.ApiPaths.ALBUMS;

@Tag(name = "Albums", description = "Endpoints de álbuns")
@RestController
@RequestMapping(ALBUMS)
public class AlbumController {

    private final AlbumService albumService;

    public AlbumController(AlbumService albumService) {
        this.albumService = albumService;
    }

    @Operation(summary = "Criar álbum", description = "Cria um novo álbum.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Criado com sucesso",
                    content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE,
                            schema = @Schema(implementation = AlbumResponse.class))),
            @ApiResponse(responseCode = "400", description = "Requisição inválida", content = @Content),
            @ApiResponse(responseCode = "401", description = "Não autenticado", content = @Content)
    })
    @PreAuthorize("hasRole('ADMIN','MANAGER')")
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<AlbumResponse> create(
            @Valid @RequestBody AlbumCreateRequest request,
            UriComponentsBuilder uriBuilder
    ) {
        AlbumResponse created = albumService.create(request);

        URI location = uriBuilder
                .path("/albums/{id}")
                .buildAndExpand(created.getId())
                .toUri();

        return ResponseEntity.created(location).body(created);
    }

    @Operation(
            summary = "Buscar álbum por título",
            description = "Retorna as informações de um álbum a partir do título (case-insensitive)."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK",
                    content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE,
                            schema = @Schema(implementation = AlbumResponse.class))),
            @ApiResponse(responseCode = "400", description = "Parâmetro inválido", content = @Content),
            @ApiResponse(responseCode = "404", description = "Álbum não encontrado", content = @Content),
            @ApiResponse(responseCode = "401", description = "Não autenticado", content = @Content)
    })
    @GetMapping(value = "/by-title/{title}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<AlbumResponse> getByTitle(@PathVariable String title) {
        return ResponseEntity.ok(albumService.getByTitle(title));
    }

    @GetMapping("/by-artist")
    public ResponseEntity<List<AlbumResponse>> getAlbumsByArtist(@RequestParam("name") String artistName) {
        return ResponseEntity.ok(albumService.getAlbumsByArtistName(artistName));
    }
}
