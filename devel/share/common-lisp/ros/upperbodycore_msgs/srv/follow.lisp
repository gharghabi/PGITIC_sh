; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude follow-request.msg.html

(cl:defclass <follow-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass follow-request (<follow-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <follow-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'follow-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<follow-request> is deprecated: use upperbodycore_msgs-srv:follow-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <follow-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:command-val is deprecated.  Use upperbodycore_msgs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <follow-request>) ostream)
  "Serializes a message object of type '<follow-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <follow-request>) istream)
  "Deserializes a message object of type '<follow-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<follow-request>)))
  "Returns string type for a service object of type '<follow-request>"
  "upperbodycore_msgs/followRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'follow-request)))
  "Returns string type for a service object of type 'follow-request"
  "upperbodycore_msgs/followRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<follow-request>)))
  "Returns md5sum for a message object of type '<follow-request>"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'follow-request)))
  "Returns md5sum for a message object of type 'follow-request"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<follow-request>)))
  "Returns full string definition for message of type '<follow-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'follow-request)))
  "Returns full string definition for message of type 'follow-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <follow-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <follow-request>))
  "Converts a ROS message object to a list"
  (cl:list 'follow-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude follow-response.msg.html

(cl:defclass <follow-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass follow-response (<follow-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <follow-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'follow-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<follow-response> is deprecated: use upperbodycore_msgs-srv:follow-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <follow-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <follow-response>) ostream)
  "Serializes a message object of type '<follow-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <follow-response>) istream)
  "Deserializes a message object of type '<follow-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<follow-response>)))
  "Returns string type for a service object of type '<follow-response>"
  "upperbodycore_msgs/followResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'follow-response)))
  "Returns string type for a service object of type 'follow-response"
  "upperbodycore_msgs/followResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<follow-response>)))
  "Returns md5sum for a message object of type '<follow-response>"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'follow-response)))
  "Returns md5sum for a message object of type 'follow-response"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<follow-response>)))
  "Returns full string definition for message of type '<follow-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'follow-response)))
  "Returns full string definition for message of type 'follow-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <follow-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <follow-response>))
  "Converts a ROS message object to a list"
  (cl:list 'follow-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'follow)))
  'follow-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'follow)))
  'follow-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'follow)))
  "Returns string type for a service object of type '<follow>"
  "upperbodycore_msgs/follow")