; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude motortorque-request.msg.html

(cl:defclass <motortorque-request> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass motortorque-request (<motortorque-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motortorque-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motortorque-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<motortorque-request> is deprecated: use upperbodycore_msgs-srv:motortorque-request instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <motortorque-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:status-val is deprecated.  Use upperbodycore_msgs-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motortorque-request>) ostream)
  "Serializes a message object of type '<motortorque-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motortorque-request>) istream)
  "Deserializes a message object of type '<motortorque-request>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motortorque-request>)))
  "Returns string type for a service object of type '<motortorque-request>"
  "upperbodycore_msgs/motortorqueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motortorque-request)))
  "Returns string type for a service object of type 'motortorque-request"
  "upperbodycore_msgs/motortorqueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motortorque-request>)))
  "Returns md5sum for a message object of type '<motortorque-request>"
  "c7a3902f32f272a0f07068f1c5bff7df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motortorque-request)))
  "Returns md5sum for a message object of type 'motortorque-request"
  "c7a3902f32f272a0f07068f1c5bff7df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motortorque-request>)))
  "Returns full string definition for message of type '<motortorque-request>"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motortorque-request)))
  "Returns full string definition for message of type 'motortorque-request"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motortorque-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motortorque-request>))
  "Converts a ROS message object to a list"
  (cl:list 'motortorque-request
    (cl:cons ':status (status msg))
))
;//! \htmlinclude motortorque-response.msg.html

(cl:defclass <motortorque-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass motortorque-response (<motortorque-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motortorque-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motortorque-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<motortorque-response> is deprecated: use upperbodycore_msgs-srv:motortorque-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <motortorque-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motortorque-response>) ostream)
  "Serializes a message object of type '<motortorque-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motortorque-response>) istream)
  "Deserializes a message object of type '<motortorque-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motortorque-response>)))
  "Returns string type for a service object of type '<motortorque-response>"
  "upperbodycore_msgs/motortorqueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motortorque-response)))
  "Returns string type for a service object of type 'motortorque-response"
  "upperbodycore_msgs/motortorqueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motortorque-response>)))
  "Returns md5sum for a message object of type '<motortorque-response>"
  "c7a3902f32f272a0f07068f1c5bff7df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motortorque-response)))
  "Returns md5sum for a message object of type 'motortorque-response"
  "c7a3902f32f272a0f07068f1c5bff7df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motortorque-response>)))
  "Returns full string definition for message of type '<motortorque-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motortorque-response)))
  "Returns full string definition for message of type 'motortorque-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motortorque-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motortorque-response>))
  "Converts a ROS message object to a list"
  (cl:list 'motortorque-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'motortorque)))
  'motortorque-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'motortorque)))
  'motortorque-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motortorque)))
  "Returns string type for a service object of type '<motortorque>"
  "upperbodycore_msgs/motortorque")