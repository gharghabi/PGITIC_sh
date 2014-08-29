; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude waveSrv-request.msg.html

(cl:defclass <waveSrv-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass waveSrv-request (<waveSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <waveSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'waveSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<waveSrv-request> is deprecated: use upperbodycore_msgs-srv:waveSrv-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <waveSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:command-val is deprecated.  Use upperbodycore_msgs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <waveSrv-request>) ostream)
  "Serializes a message object of type '<waveSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <waveSrv-request>) istream)
  "Deserializes a message object of type '<waveSrv-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<waveSrv-request>)))
  "Returns string type for a service object of type '<waveSrv-request>"
  "upperbodycore_msgs/waveSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'waveSrv-request)))
  "Returns string type for a service object of type 'waveSrv-request"
  "upperbodycore_msgs/waveSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<waveSrv-request>)))
  "Returns md5sum for a message object of type '<waveSrv-request>"
  "2fb3aa2736d70ecbfc297d3d9b879661")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'waveSrv-request)))
  "Returns md5sum for a message object of type 'waveSrv-request"
  "2fb3aa2736d70ecbfc297d3d9b879661")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<waveSrv-request>)))
  "Returns full string definition for message of type '<waveSrv-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'waveSrv-request)))
  "Returns full string definition for message of type 'waveSrv-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <waveSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <waveSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'waveSrv-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude waveSrv-response.msg.html

(cl:defclass <waveSrv-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass waveSrv-response (<waveSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <waveSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'waveSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<waveSrv-response> is deprecated: use upperbodycore_msgs-srv:waveSrv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <waveSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <waveSrv-response>) ostream)
  "Serializes a message object of type '<waveSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <waveSrv-response>) istream)
  "Deserializes a message object of type '<waveSrv-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<waveSrv-response>)))
  "Returns string type for a service object of type '<waveSrv-response>"
  "upperbodycore_msgs/waveSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'waveSrv-response)))
  "Returns string type for a service object of type 'waveSrv-response"
  "upperbodycore_msgs/waveSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<waveSrv-response>)))
  "Returns md5sum for a message object of type '<waveSrv-response>"
  "2fb3aa2736d70ecbfc297d3d9b879661")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'waveSrv-response)))
  "Returns md5sum for a message object of type 'waveSrv-response"
  "2fb3aa2736d70ecbfc297d3d9b879661")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<waveSrv-response>)))
  "Returns full string definition for message of type '<waveSrv-response>"
  (cl:format cl:nil "bool result~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'waveSrv-response)))
  "Returns full string definition for message of type 'waveSrv-response"
  (cl:format cl:nil "bool result~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <waveSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <waveSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'waveSrv-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'waveSrv)))
  'waveSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'waveSrv)))
  'waveSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'waveSrv)))
  "Returns string type for a service object of type '<waveSrv>"
  "upperbodycore_msgs/waveSrv")