package com.uneedcomms.streamdataapi.events;

import lombok.*;

import javax.validation.constraints.NotEmpty;

@NoArgsConstructor @AllArgsConstructor
@Data @Builder
public class EventDto {

    @NotEmpty
    private int external_id;
    @NotEmpty
    private String name;

}
