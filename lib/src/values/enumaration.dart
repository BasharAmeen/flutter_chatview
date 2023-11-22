/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

// Different types Message of ChatView
enum MessageType {
  image,
  text,

  /// Only supported on android and ios
  video,
  voice,
  custom
}

/// Events, Wheter the user is still typing a message or has
/// typed the message
enum TypeWriterStatus { typing, typed }

/// [MessageStatus] defines the current state of the message
/// if you are sender sending a message then, the
enum MessageStatus { read, delivered, undelivered, pending }

extension MessageStatusExtension on MessageStatus {
  static MessageStatus fromValueAsString(String value) {
    switch (value) {
      case 'read':
        return MessageStatus.read;
      case 'delivered':
        return MessageStatus.delivered;
      case 'undelivered':
        return MessageStatus.undelivered;
      case 'pending':
        return MessageStatus.pending;

      default:
        throw Exception('Invalid MessageType string value: $value');
    }
  }
}

/// Types of states
enum ChatViewState { hasMessages, noData, loading, error }

enum ShowReceiptsIn { all, lastMessage }

extension ChatViewStateExtension on ChatViewState {
  bool get hasMessages => this == ChatViewState.hasMessages;

  bool get isLoading => this == ChatViewState.loading;

  bool get isError => this == ChatViewState.error;

  bool get noMessages => this == ChatViewState.noData;
}

extension MessageTypeExtension on MessageType {
  String get valueAsString {
    switch (this) {
      case MessageType.image:
        return 'image';
      case MessageType.text:
        return 'text';
      case MessageType.video:
        return 'video';
      case MessageType.voice:
        return 'voice';
      case MessageType.custom:
        return 'custom';
      default:
        throw Exception('Invalid MessageType value: $this');
    }
  }

  static MessageType fromValueAsString(String value) {
    switch (value) {
      case 'image':
        return MessageType.image;
      case 'text':
        return MessageType.text;
      case 'video':
        return MessageType.video;
      case 'voice':
        return MessageType.voice;
      case 'custom':
        return MessageType.custom;
      default:
        throw Exception('Invalid MessageType string value: $value');
    }
  }
}
