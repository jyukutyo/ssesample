package jyukutyo;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Controller
public class SseController {
    private SseEmitter sseEmitter = new SseEmitter();

    @RequestMapping(path = "index")
    public SseEmitter index() throws IOException {
        sseEmitter.send("message");
        return sseEmitter;
    }

}
