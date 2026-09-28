# SPDX-FileCopyrightText: 2026 NVIDIA CORPORATION & AFFILIATES
# SPDX-License-Identifier: Apache-2.0

import gradio as gr


def create_chatbot_interface(chatbot):
    def generate_response(user_input):
        return chatbot.chat(user_input)

    with gr.Blocks() as app:
        with gr.Row():
            text_input = gr.Textbox(
                label="Your Message",
                placeholder="Enter your message and press ENTER",
            )

        output_area = gr.Textbox(
            label="Chatbot Response",
            interactive=False,
            lines=10,
        )

        text_input.submit(generate_response, inputs=text_input, outputs=output_area)

    return app


def create_chatbot_interface_from_bot(chatbot):
    def generate_response(user_input, history):
        return chatbot.chat(user_input)

    # Uncomment when you're ready to try this.
    app = gr.ChatInterface(generate_response).queue()

    return app
