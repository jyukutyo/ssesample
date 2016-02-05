package jyukutyo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Bean
    public WebSocketHandler myHandler() {
        return new MyHandler();
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry webSocketHandlerRegistry) {
        // Handlerインスタンスは全Websocketコネクションで共通、1つとなる
        webSocketHandlerRegistry.addHandler(myHandler(), "/myHandler");

        // WebsocketのコネクションごとにHandlerインスタンスを生成するときはPerConnectionWebSocketHandlerを使う
        // registry.addHandler(new PerConnectionWebSocketHandler(MyxHandler.class), "/websocket/myHandler");
    }
}
