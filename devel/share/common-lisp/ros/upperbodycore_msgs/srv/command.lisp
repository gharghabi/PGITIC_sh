; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude command-request.msg.html

(cl:defclass <command-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass command-request (<command-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <command-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'command-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<command-request> is deprecated: use upperbodycore_msgs-srv:command-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <command-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:command-val is deprecated.  Use upperbodycore_msgs-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <command-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:id-val is deprecated.  Use upperbodycore_msgs-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <command-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:value-val is deprecated.  Use upperbodycore_msgs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <command-request>) ostream)
  "Serializes a message object of type '<command-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <command-request>) istream)
  "Deserializes a message object of type '<command-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<command-request>)))
  "Returns string type for a service object of type '<command-request>"
  "upperbodycore_msgs/commandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'command-request)))
  "Returns string type for a service object of type 'command-request"
  "upperbodycore_msgs/commandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<command-request>)))
  "Returns md5sum for a message object of type '<command-request>"
  "328ecaf9e1a9612bd1d019c829c72790")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'command-request)))
  "Returns md5sum for a message object of type 'command-request"
  "328ecaf9e1a9612bd1d019c829c72790")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<command-request>)))
  "Returns full string definition for message of type '<command-request>"
  (cl:format cl:nil "string command~%string id~%int32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'command-request)))
  "Returns full string definition for message of type 'command-request"
  (cl:format cl:nil "string command~%string id~%int32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <command-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     4 (cl:length (cl:slot-value msg 'id))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <command-request>))
  "Converts a ROS message object to a list"
  (cl:list 'command-request
    (cl:cons ':command (command msg))
    (cl:cons ':id (id msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude command-response.msg.html

(cl:defclass <command-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass command-response (<command-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <command-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'command-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<command-response> is deprecated: use upperbodycore_msgs-srv:command-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <command-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <command-response>) ostream)
  "Serializes a message object of type '<command-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <command-response>) istream)
  "Deserializes a message object of type '<command-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<command-response>)))
  "Returns string type for a service object of type '<command-response>"
  "upperbodycore_msgs/commandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'command-response)))
  "Returns string type for a service object of type 'command-response"
  "upperbodycore_msgs/commandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<command-response>)))
  "Returns md5sum for a message object of type '<command-response>"
  "328ecaf9e1a9612bd1d019c829c72790")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'command-response)))
  "Returns md5sum for a message object of type 'command-response"
  "328ecaf9e1a9612bd1d019c829c72790")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<command-response>)))
  "Returns full string definition for message of type '<command-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'command-response)))
  "Returns full string definition for message of type 'command-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <command-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <command-response>))
  "Converts a ROS message object to a list"
  (cl:list 'command-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'command)))
  'command-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'command)))
  'command-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'command)))
  "Returns string type for a service object of type '<command>"
  "upperbodycore_msgs/command")