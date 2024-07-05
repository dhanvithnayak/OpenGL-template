COMPILER := clang++
FLAGS := -lglfw -lGL -lm -lX11 -lpthread -lXi -lXrandr -ldl -lassimp
SRC := src
SHADER := src/shader
CAMERA := src/camera
MODEL := src/model
OUT := gl
BUILD := build

run: $(OUT)
	./$(BUILD)/$(OUT)

$(OUT): $(SRC)/gl.cpp $(SHADER)/shader.cpp $(MODEL)/model.cpp $(SRC)/glad.c $(MODEL)/mesh.cpp
	if [ ! -d "$(BUILD)" ]; then mkdir $(BUILD); fi
	$(COMPILER) $^ $(FLAGS) -o $(BUILD)/$(OUT)

clean:
	rm -rf $(BUILD)
