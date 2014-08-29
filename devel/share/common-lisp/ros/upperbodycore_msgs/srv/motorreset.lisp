; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude motorreset-request.msg.html

(cl:defclass <motorreset-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:string
    :initform ""))
)

(cl:defclass motorreset-request (<motorreset-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motorreset-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motorreset-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<motorreset-request> is deprecated: use upperbodycore_msgs-srv:motorreset-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <motorreset-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:id-val is deprecated.  Use upperbodycore_msgs-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motorreset-request>) ostream)
  "Serializes a message object of type '<motorreset-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motorreset-request>) istream)
  "Deserializes a message object of type '<motorreset-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motorreset-request>)))
  "Returns string type for a service object of type '<motorreset-request>"
  "upperbodycore_msgs/motorresetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motorreset-request)))
  "Returns string type for a service object of type 'motorreset-request"
  "upperbodycore_msgs/motorresetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motorreset-request>)))
  "Returns md5sum for a message object of type '<motorreset-request>"
  "0e6529d867760e33e829c13b746993f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motorreset-request)))
  "Returns md5sum for a message object of type 'motorreset-request"
  "0e6529d867760e33e829c13b746993f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motorreset-request>)))
  "Returns full string definition for message of type '<motorreset-request>"
  (cl:format cl:nil "string id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motorreset-request)))
  "Returns full string definition for message of type 'motorreset-request"
  (cl:format cl:nil "string id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motorreset-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motorreset-request>))
  "Converts a ROS message object to a list"
  (cl:list 'motorreset-request
    (cl:cons ':id (id msg))
))
;//! \htmlinclude motorreset-response.msg.html

(cl:defclass <motorreset-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass motorreset-response (<motorreset-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motorreset-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motorreset-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<motorreset-response> is deprecated: use upperbodycore_msgs-srv:motorreset-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <motorreset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motorreset-response>) ostream)
  "Serializes a message object of type '<motorreset-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motorreset-response>) istream)
  "Deserializes a message object of type '<motorreset-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motorreset-response>)))
  "Returns string type for a service object of type '<motorreset-response>"
  "upperbodycore_msgs/motorresetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motorreset-response)))
  "Returns string type for a service object of type 'motorreset-response"
  "upperbodycore_msgs/motorresetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motorreset-response>)))
  "Returns md5sum for a message object of type '<motorreset-response>"
  "0e6529d867760e33e829c13b746993f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motorreset-response)))
  "Returns md5sum for a message object of type 'motorreset-response"
  "0e6529d867760e33e829c13b746993f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motorreset-response>)))
  "Returns full string definition for message of type '<motorreset-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motorreset-response)))
  "Returns full string definition for message of type 'motorreset-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motorreset-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motorreset-response>))
  "Converts a ROS message object to a list"
  (cl:list 'motorreset-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'motorreset)))
  'motorreset-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'motorreset)))
  'motorreset-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motorreset)))
  "Returns string type for a service object of type '<motorreset>"
  "upperbodycore_msgs/motorreset")