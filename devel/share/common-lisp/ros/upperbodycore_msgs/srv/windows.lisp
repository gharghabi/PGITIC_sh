; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude windows-request.msg.html

(cl:defclass <windows-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass windows-request (<windows-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <windows-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'windows-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<windows-request> is deprecated: use upperbodycore_msgs-srv:windows-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <windows-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:command-val is deprecated.  Use upperbodycore_msgs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <windows-request>) ostream)
  "Serializes a message object of type '<windows-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <windows-request>) istream)
  "Deserializes a message object of type '<windows-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<windows-request>)))
  "Returns string type for a service object of type '<windows-request>"
  "upperbodycore_msgs/windowsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'windows-request)))
  "Returns string type for a service object of type 'windows-request"
  "upperbodycore_msgs/windowsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<windows-request>)))
  "Returns md5sum for a message object of type '<windows-request>"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'windows-request)))
  "Returns md5sum for a message object of type 'windows-request"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<windows-request>)))
  "Returns full string definition for message of type '<windows-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'windows-request)))
  "Returns full string definition for message of type 'windows-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <windows-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <windows-request>))
  "Converts a ROS message object to a list"
  (cl:list 'windows-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude windows-response.msg.html

(cl:defclass <windows-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass windows-response (<windows-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <windows-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'windows-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<windows-response> is deprecated: use upperbodycore_msgs-srv:windows-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <windows-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <windows-response>) ostream)
  "Serializes a message object of type '<windows-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <windows-response>) istream)
  "Deserializes a message object of type '<windows-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<windows-response>)))
  "Returns string type for a service object of type '<windows-response>"
  "upperbodycore_msgs/windowsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'windows-response)))
  "Returns string type for a service object of type 'windows-response"
  "upperbodycore_msgs/windowsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<windows-response>)))
  "Returns md5sum for a message object of type '<windows-response>"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'windows-response)))
  "Returns md5sum for a message object of type 'windows-response"
  "e62ac06cf7c221e8f3746d0b18c22a3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<windows-response>)))
  "Returns full string definition for message of type '<windows-response>"
  (cl:format cl:nil "string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'windows-response)))
  "Returns full string definition for message of type 'windows-response"
  (cl:format cl:nil "string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <windows-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <windows-response>))
  "Converts a ROS message object to a list"
  (cl:list 'windows-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'windows)))
  'windows-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'windows)))
  'windows-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'windows)))
  "Returns string type for a service object of type '<windows>"
  "upperbodycore_msgs/windows")