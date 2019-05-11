package com.uneedcomms.streamdataapi.api;

import com.uneedcomms.streamdataapi.api.request.StreamDto;
import org.springframework.hateoas.MediaTypes;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/api/stream")
public class ApiController {

    @GetMapping(produces = MediaTypes.HAL_JSON_UTF8_VALUE)
    public ResponseEntity createEvent(@RequestBody @Valid StreamDto streamDto, Errors errors) {
        return null;
    }

}
