; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude stop-request.msg.html

(cl:defclass <stop-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass stop-request (<stop-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stop-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stop-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<stop-request> is deprecated: use upperbodycore_msgs-srv:stop-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <stop-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:command-val is deprecated.  Use upperbodycore_msgs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stop-request>) ostream)
  "Serializes a message object of type '<stop-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stop-request>) istream)
  "Deserializes a message object of type '<stop-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stop-request>)))
  "Returns string type for a service object of type '<stop-request>"
  "upperbodycore_msgs/stopRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stop-request)))
  "Returns string type for a service object of type 'stop-request"
  "upperbodycore_msgs/stopRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stop-request>)))
  "Returns md5sum for a message object of type '<stop-request>"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stop-request)))
  "Returns md5sum for a message object of type 'stop-request"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stop-request>)))
  "Returns full string definition for message of type '<stop-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stop-request)))
  "Returns full string definition for message of type 'stop-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stop-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stop-request>))
  "Converts a ROS message object to a list"
  (cl:list 'stop-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude stop-response.msg.html

(cl:defclass <stop-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass stop-response (<stop-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stop-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stop-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<stop-response> is deprecated: use upperbodycore_msgs-srv:stop-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <stop-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stop-response>) ostream)
  "Serializes a message object of type '<stop-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stop-response>) istream)
  "Deserializes a message object of type '<stop-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stop-response>)))
  "Returns string type for a service object of type '<stop-response>"
  "upperbodycore_msgs/stopResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stop-response)))
  "Returns string type for a service object of type 'stop-response"
  "upperbodycore_msgs/stopResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stop-response>)))
  "Returns md5sum for a message object of type '<stop-response>"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stop-response)))
  "Returns md5sum for a message object of type 'stop-response"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stop-response>)))
  "Returns full string definition for message of type '<stop-response>"
  (cl:format cl:nil "string result~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stop-response)))
  "Returns full string definition for message of type 'stop-response"
  (cl:format cl:nil "string result~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stop-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stop-response>))
  "Converts a ROS message object to a list"
  (cl:list 'stop-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'stop)))
  'stop-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'stop)))
  'stop-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stop)))
  "Returns string type for a service object of type '<stop>"
  "upperbodycore_msgs/stop")