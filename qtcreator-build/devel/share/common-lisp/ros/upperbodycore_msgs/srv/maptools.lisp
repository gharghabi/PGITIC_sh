; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude maptools-request.msg.html

(cl:defclass <maptools-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:string
    :initform ""))
)

(cl:defclass maptools-request (<maptools-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <maptools-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'maptools-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<maptools-request> is deprecated: use upperbodycore_msgs-srv:maptools-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <maptools-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:command-val is deprecated.  Use upperbodycore_msgs-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <maptools-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:id-val is deprecated.  Use upperbodycore_msgs-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <maptools-request>) ostream)
  "Serializes a message object of type '<maptools-request>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <maptools-request>) istream)
  "Deserializes a message object of type '<maptools-request>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<maptools-request>)))
  "Returns string type for a service object of type '<maptools-request>"
  "upperbodycore_msgs/maptoolsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'maptools-request)))
  "Returns string type for a service object of type 'maptools-request"
  "upperbodycore_msgs/maptoolsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<maptools-request>)))
  "Returns md5sum for a message object of type '<maptools-request>"
  "c48c97f05d7a6c23d0cfb11962dfe8e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'maptools-request)))
  "Returns md5sum for a message object of type 'maptools-request"
  "c48c97f05d7a6c23d0cfb11962dfe8e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<maptools-request>)))
  "Returns full string definition for message of type '<maptools-request>"
  (cl:format cl:nil "string command~%string id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'maptools-request)))
  "Returns full string definition for message of type 'maptools-request"
  (cl:format cl:nil "string command~%string id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <maptools-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     4 (cl:length (cl:slot-value msg 'id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <maptools-request>))
  "Converts a ROS message object to a list"
  (cl:list 'maptools-request
    (cl:cons ':command (command msg))
    (cl:cons ':id (id msg))
))
;//! \htmlinclude maptools-response.msg.html

(cl:defclass <maptools-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass maptools-response (<maptools-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <maptools-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'maptools-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<maptools-response> is deprecated: use upperbodycore_msgs-srv:maptools-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <maptools-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <maptools-response>) ostream)
  "Serializes a message object of type '<maptools-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <maptools-response>) istream)
  "Deserializes a message object of type '<maptools-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<maptools-response>)))
  "Returns string type for a service object of type '<maptools-response>"
  "upperbodycore_msgs/maptoolsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'maptools-response)))
  "Returns string type for a service object of type 'maptools-response"
  "upperbodycore_msgs/maptoolsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<maptools-response>)))
  "Returns md5sum for a message object of type '<maptools-response>"
  "c48c97f05d7a6c23d0cfb11962dfe8e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'maptools-response)))
  "Returns md5sum for a message object of type 'maptools-response"
  "c48c97f05d7a6c23d0cfb11962dfe8e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<maptools-response>)))
  "Returns full string definition for message of type '<maptools-response>"
  (cl:format cl:nil "string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'maptools-response)))
  "Returns full string definition for message of type 'maptools-response"
  (cl:format cl:nil "string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <maptools-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <maptools-response>))
  "Converts a ROS message object to a list"
  (cl:list 'maptools-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'maptools)))
  'maptools-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'maptools)))
  'maptools-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'maptools)))
  "Returns string type for a service object of type '<maptools>"
  "upperbodycore_msgs/maptools")