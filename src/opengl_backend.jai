// This is just stuff from when I was doing it in opengl. Maybe it will be useful in the futuren but I doubt it! Probably going to end up doing Vulkan in the future but I have not decided yet.
#if 0 {
vert_shader :: #string END
#version 330 core
#extension GL_ARB_explicit_uniform_location : require
layout(location = 0) in vec3 aPos;
layout(location = 2) uniform mat4 model;
layout(location = 3) uniform mat4 view;
layout(location = 4) uniform mat4 proj;
layout(location = 5) in vec2 aColor;

out vec2 vertexColor;
void main() {
    gl_Position = proj * view * model * vec4(aPos, 1.0);
    vertexColor = aColor;
}
END;

fragment_shader :: #string END
#version 330 core
#extension GL_ARB_explicit_uniform_location : require
layout(location = 0) out vec4 FragColor;
layout(location = 1) uniform vec3 uniformColor;
    in vec2 vertexColor;
void main() {
    FragColor = gl_FragCoord;
}
END;

gl_load_used_procs :: inline () { generated_gl_load_used_procs(); }

gl_init :: (swapchain_lengths: []u32, using gl_rendering: *Renderer) {
    gl_load_used_procs();
    
    framebuffers = NewArray(swapchain_lengths.count, []GLuint); // LEAK
    for * framebuffers {
        (<< it) = NewArray(swapchain_lengths[it_index], GLuint); // LEAK
        glGenFramebuffers(swapchain_lengths[it_index], it.data);
    }

    result: s32;
    info_log: [512]u8;
    
    vert_shader_id := glCreateShader(GL_VERTEX_SHADER);
    vertex_src := *u8.[vert_shader.data];
    glShaderSource(vert_shader_id, 1, vertex_src.data, null);
    glCompileShader(vert_shader_id);
    glGetShaderiv(vert_shader_id, GL_COMPILE_STATUS, *result);
    if !result {
        glGetShaderInfoLog(vert_shader_id, 512, null, info_log.data);
            print("Could not compile vertex shader: %\n", to_string(info_log.data));
        exit(1);
    } else {
        print("Compiled vertex shader.\n");
    }

    fragment_shader_id := glCreateShader(GL_FRAGMENT_SHADER);
    fragment_src := *u8.[fragment_shader.data];
    glShaderSource(fragment_shader_id, 1, fragment_src.data, null);
    glCompileShader(fragment_shader_id);
    glGetShaderiv(fragment_shader_id, GL_COMPILE_STATUS, *result);
    if !result {
        glGetShaderInfoLog(fragment_shader_id, 512, null, info_log.data);
        print("Could not compile fragment shader: %\n", to_string(info_log.data));
        exit(1);
    } else {
        print("Compiled fragment shader.\n");
    }

    shader_program_id = glCreateProgram();
    glAttachShader(shader_program_id, vert_shader_id);
    glAttachShader(shader_program_id, fragment_shader_id);
    glLinkProgram(shader_program_id);
    glGetProgramiv(shader_program_id, GL_LINK_STATUS, *result);
    if !result {
        glGetProgramInfoLog(shader_program_id, 512, null, info_log.data);
        print("Could not link shader program: %\n", to_string(info_log.data));
    } else {
        print("Linked shader program.\n");
    }

    glDeleteShader(vert_shader_id);
	  glDeleteShader(fragment_shader_id); // TODO: don't delete this and set up hot reloading for frag only

    vertices := float.[ -0.5, -0.5, -0.5, 0.0, 0.0, 0.5,  -0.5, -0.5, 1.0, 0.0,
	                      0.5,  0.5,  -0.5, 1.0, 1.0, 0.5,  0.5,  -0.5, 1.0, 1.0,
	                      -0.5, 0.5,  -0.5, 0.0, 1.0, -0.5, -0.5, -0.5, 0.0, 0.0,
                        
	                      -0.5, -0.5, 0.5,  0.0, 0.0, 0.5,  -0.5, 0.5,  1.0, 0.0,
	                      0.5,  0.5,  0.5,  1.0, 1.0, 0.5,  0.5,  0.5,  1.0, 1.0,
	                      -0.5, 0.5,  0.5,  0.0, 1.0, -0.5, -0.5, 0.5,  0.0, 0.0,
                        
	                      -0.5, 0.5,  0.5,  1.0, 0.0, -0.5, 0.5,  -0.5, 1.0, 1.0,
	                      -0.5, -0.5, -0.5, 0.0, 1.0, -0.5, -0.5, -0.5, 0.0, 1.0,
	                      -0.5, -0.5, 0.5,  0.0, 0.0, -0.5, 0.5,  0.5,  1.0, 0.0,
                        
	                      0.5,  0.5,  0.5,  1.0, 0.0, 0.5,  0.5,  -0.5, 1.0, 1.0,
	                      0.5,  -0.5, -0.5, 0.0, 1.0, 0.5,  -0.5, -0.5, 0.0, 1.0,
	                      0.5,  -0.5, 0.5,  0.0, 0.0, 0.5,  0.5,  0.5,  1.0, 0.0,
                        
	                      -0.5, -0.5, -0.5, 0.0, 1.0, 0.5,  -0.5, -0.5, 1.0, 1.0,
	                      0.5,  -0.5, 0.5,  1.0, 0.0, 0.5,  -0.5, 0.5,  1.0, 0.0,
	                      -0.5, -0.5, 0.5,  0.0, 0.0, -0.5, -0.5, -0.5, 0.0, 1.0,
                        
	                      -0.5, 0.5,  -0.5, 0.0, 1.0, 0.5,  0.5,  -0.5, 1.0, 1.0,
	                      0.5,  0.5,  0.5,  1.0, 0.0, 0.5,  0.5,  0.5,  1.0, 0.0,
	                      -0.5, 0.5,  0.5,  0.0, 0.0, -0.5, 0.5,  -0.5, 0.0, 1.0 ];

    VBO: GLuint;
    glGenBuffers(1, *VBO);

    glGenVertexArrays(1, *VAO);

    glBindVertexArray(VAO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, vertices.count * size_of(float), vertices.data, GL_DYNAMIC_DRAW);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 5 * size_of(float), null);
    glEnableVertexAttribArray(0);

    glBufferData(GL_ARRAY_BUFFER, vertices.count * size_of(float), vertices.data , GL_DYNAMIC_DRAW);
    glVertexAttribPointer(5, 2, GL_FLOAT, GL_FALSE, 5 * size_of(float), xx (3 * size_of(float)));

    glEnable(GL_DEPTH_TEST);
}
}
