; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude recordSrv-request.msg.html

(cl:defclass <recordSrv-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass recordSrv-request (<recordSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recordSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recordSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<recordSrv-request> is deprecated: use upperbodycore_msgs-srv:recordSrv-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <recordSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:command-val is deprecated.  Use upperbodycore_msgs-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <recordSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:path-val is deprecated.  Use upperbodycore_msgs-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recordSrv-request>) ostream)
  "Serializes a message object of type '<recordSrv-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recordSrv-request>) istream)
  "Deserializes a message object of type '<recordSrv-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recordSrv-request>)))
  "Returns string type for a service object of type '<recordSrv-request>"
  "upperbodycore_msgs/recordSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recordSrv-request)))
  "Returns string type for a service object of type 'recordSrv-request"
  "upperbodycore_msgs/recordSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recordSrv-request>)))
  "Returns md5sum for a message object of type '<recordSrv-request>"
  "35a8d3305f7acd21ced17445635a3768")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recordSrv-request)))
  "Returns md5sum for a message object of type 'recordSrv-request"
  "35a8d3305f7acd21ced17445635a3768")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recordSrv-request>)))
  "Returns full string definition for message of type '<recordSrv-request>"
  (cl:format cl:nil "string command~%string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recordSrv-request)))
  "Returns full string definition for message of type 'recordSrv-request"
  (cl:format cl:nil "string command~%string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recordSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recordSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'recordSrv-request
    (cl:cons ':command (command msg))
    (cl:cons ':path (path msg))
))
;//! \htmlinclude recordSrv-response.msg.html

(cl:defclass <recordSrv-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass recordSrv-response (<recordSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recordSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recordSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<recordSrv-response> is deprecated: use upperbodycore_msgs-srv:recordSrv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <recordSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recordSrv-response>) ostream)
  "Serializes a message object of type '<recordSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recordSrv-response>) istream)
  "Deserializes a message object of type '<recordSrv-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recordSrv-response>)))
  "Returns string type for a service object of type '<recordSrv-response>"
  "upperbodycore_msgs/recordSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recordSrv-response)))
  "Returns string type for a service object of type 'recordSrv-response"
  "upperbodycore_msgs/recordSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recordSrv-response>)))
  "Returns md5sum for a message object of type '<recordSrv-response>"
  "35a8d3305f7acd21ced17445635a3768")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recordSrv-response)))
  "Returns md5sum for a message object of type 'recordSrv-response"
  "35a8d3305f7acd21ced17445635a3768")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recordSrv-response>)))
  "Returns full string definition for message of type '<recordSrv-response>"
  (cl:format cl:nil "bool result~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recordSrv-response)))
  "Returns full string definition for message of type 'recordSrv-response"
  (cl:format cl:nil "bool result~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recordSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recordSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'recordSrv-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'recordSrv)))
  'recordSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'recordSrv)))
  'recordSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recordSrv)))
  "Returns string type for a service object of type '<recordSrv>"
  "upperbodycore_msgs/recordSrv")