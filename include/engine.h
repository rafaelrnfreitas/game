#ifndef ENGINE_H
#define ENGINE_H

typedef struct {
    int running;
} engine_t;

int engine_init(engine_t* engine);
void engine_update(engine_t* engine, float dt);
void engine_draw(engine_t* engine);
void engine_run(engine_t* engine);
void engine_shutdown(engine_t* engine);

#endif
