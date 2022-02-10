package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor

public class Playlist {
    private int id;
    private Song song;
    private int idUser;

    @Override
    public String toString() {
        return "Playlist{" +
                "id=" + id +
                ", song=" + song +
                ", idUser=" + idUser +
                '}';
    }
}
