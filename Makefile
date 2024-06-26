COMPILER := clang++
FLAGS := -lglfw -lGL -lm -lX11 -lpthread -lXi -lXrandr -ldl
SRC := src
SHADER := src/shader
CAMERA := src/camera
OUT := gl
BUILD := build

run: $(OUT)
	./$(BUILD)/$(OUT) &

$(OUT): $(SRC)/gl.cpp $(SHADER)/shader.cpp $(SRC)/glad.c
	if [ ! -d "$(BUILD)" ]; then mkdir $(BUILD); fi
	$(COMPILER) $^ $(FLAGS) -o $(BUILD)/$(OUT)

clean:
	rm -rf $(BUILD)
