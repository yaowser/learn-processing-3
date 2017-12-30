class Engine {
    Emitter emitter;
    Emitter[] emitters;
    float gravity;
    PVector turbulence;
    PVector wind;
    
    Engine() {
    }
    
    Engine(Emitter emitter, float gravity, PVector turbulence, PVector wind){
      this.emitter = emitter;
      this.gravity = gravity;
      this.turbulence = turbulence;
      this.wind=wind;
    }
    Engine(Emitter[] emitters){
      this.emitters=emitters;
    }
    
    void start(){
      emitter.run(gravity,turbulence,wind);
    }
    void stop(){
    }
}