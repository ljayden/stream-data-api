package com.uneedcomms.streamdataapi.api.request;

import lombok.*;

import javax.validation.constraints.NotEmpty;

@NoArgsConstructor @AllArgsConstructor
@Data @Builder
public class StreamDto {

    @NotEmpty
    private int external_id;
    @NotEmpty
    private String name;

}
