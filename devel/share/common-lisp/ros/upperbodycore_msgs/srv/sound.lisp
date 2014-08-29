; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude sound-request.msg.html

(cl:defclass <sound-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (path
    :reader path
    :initarg :path
    :type cl:string
    :initform ""))
)

(cl:defclass sound-request (<sound-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sound-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sound-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<sound-request> is deprecated: use upperbodycore_msgs-srv:sound-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <sound-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:command-val is deprecated.  Use upperbodycore_msgs-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <sound-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:path-val is deprecated.  Use upperbodycore_msgs-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sound-request>) ostream)
  "Serializes a message object of type '<sound-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sound-request>) istream)
  "Deserializes a message object of type '<sound-request>"
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
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sound-request>)))
  "Returns string type for a service object of type '<sound-request>"
  "upperbodycore_msgs/soundRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sound-request)))
  "Returns string type for a service object of type 'sound-request"
  "upperbodycore_msgs/soundRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sound-request>)))
  "Returns md5sum for a message object of type '<sound-request>"
  "35a8d3305f7acd21ced17445635a3768")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sound-request)))
  "Returns md5sum for a message object of type 'sound-request"
  "35a8d3305f7acd21ced17445635a3768")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sound-request>)))
  "Returns full string definition for message of type '<sound-request>"
  (cl:format cl:nil "string command~%string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sound-request)))
  "Returns full string definition for message of type 'sound-request"
  (cl:format cl:nil "string command~%string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sound-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sound-request>))
  "Converts a ROS message object to a list"
  (cl:list 'sound-request
    (cl:cons ':command (command msg))
    (cl:cons ':path (path msg))
))
;//! \htmlinclude sound-response.msg.html

(cl:defclass <sound-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass sound-response (<sound-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sound-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sound-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<sound-response> is deprecated: use upperbodycore_msgs-srv:sound-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <sound-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sound-response>) ostream)
  "Serializes a message object of type '<sound-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sound-response>) istream)
  "Deserializes a message object of type '<sound-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sound-response>)))
  "Returns string type for a service object of type '<sound-response>"
  "upperbodycore_msgs/soundResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sound-response)))
  "Returns string type for a service object of type 'sound-response"
  "upperbodycore_msgs/soundResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sound-response>)))
  "Returns md5sum for a message object of type '<sound-response>"
  "35a8d3305f7acd21ced17445635a3768")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sound-response)))
  "Returns md5sum for a message object of type 'sound-response"
  "35a8d3305f7acd21ced17445635a3768")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sound-response>)))
  "Returns full string definition for message of type '<sound-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sound-response)))
  "Returns full string definition for message of type 'sound-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sound-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sound-response>))
  "Converts a ROS message object to a list"
  (cl:list 'sound-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'sound)))
  'sound-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'sound)))
  'sound-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sound)))
  "Returns string type for a service object of type '<sound>"
  "upperbodycore_msgs/sound")