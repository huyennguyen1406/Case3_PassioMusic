package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class Song {
    private int id;
    private String nameSong;
    private String singerName;
    private String link;
    private String image;
    private double price;

    @Override
    public String toString() {
        return "Songs{" +
                "id=" + id +
                ", nameSong='" + nameSong + '\'' +
                ", singerName='" + singerName + '\'' +
                ", link='" + link + '\'' +
                ", image='" + image + '\'' +
                ", price='" + price + '\'' +
                '}';
    }
}
