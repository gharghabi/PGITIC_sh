; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude close_skeleton-request.msg.html

(cl:defclass <close_skeleton-request> (roslisp-msg-protocol:ros-message)
  ((close
    :reader close
    :initarg :close
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass close_skeleton-request (<close_skeleton-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <close_skeleton-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'close_skeleton-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<close_skeleton-request> is deprecated: use upperbodycore_msgs-srv:close_skeleton-request instead.")))

(cl:ensure-generic-function 'close-val :lambda-list '(m))
(cl:defmethod close-val ((m <close_skeleton-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:close-val is deprecated.  Use upperbodycore_msgs-srv:close instead.")
  (close m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <close_skeleton-request>) ostream)
  "Serializes a message object of type '<close_skeleton-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'close) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <close_skeleton-request>) istream)
  "Deserializes a message object of type '<close_skeleton-request>"
    (cl:setf (cl:slot-value msg 'close) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<close_skeleton-request>)))
  "Returns string type for a service object of type '<close_skeleton-request>"
  "upperbodycore_msgs/close_skeletonRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'close_skeleton-request)))
  "Returns string type for a service object of type 'close_skeleton-request"
  "upperbodycore_msgs/close_skeletonRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<close_skeleton-request>)))
  "Returns md5sum for a message object of type '<close_skeleton-request>"
  "87c58835787aa5831c4efbc669381941")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'close_skeleton-request)))
  "Returns md5sum for a message object of type 'close_skeleton-request"
  "87c58835787aa5831c4efbc669381941")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<close_skeleton-request>)))
  "Returns full string definition for message of type '<close_skeleton-request>"
  (cl:format cl:nil "bool close~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'close_skeleton-request)))
  "Returns full string definition for message of type 'close_skeleton-request"
  (cl:format cl:nil "bool close~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <close_skeleton-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <close_skeleton-request>))
  "Converts a ROS message object to a list"
  (cl:list 'close_skeleton-request
    (cl:cons ':close (close msg))
))
;//! \htmlinclude close_skeleton-response.msg.html

(cl:defclass <close_skeleton-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass close_skeleton-response (<close_skeleton-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <close_skeleton-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'close_skeleton-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<close_skeleton-response> is deprecated: use upperbodycore_msgs-srv:close_skeleton-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <close_skeleton-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <close_skeleton-response>) ostream)
  "Serializes a message object of type '<close_skeleton-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <close_skeleton-response>) istream)
  "Deserializes a message object of type '<close_skeleton-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<close_skeleton-response>)))
  "Returns string type for a service object of type '<close_skeleton-response>"
  "upperbodycore_msgs/close_skeletonResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'close_skeleton-response)))
  "Returns string type for a service object of type 'close_skeleton-response"
  "upperbodycore_msgs/close_skeletonResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<close_skeleton-response>)))
  "Returns md5sum for a message object of type '<close_skeleton-response>"
  "87c58835787aa5831c4efbc669381941")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'close_skeleton-response)))
  "Returns md5sum for a message object of type 'close_skeleton-response"
  "87c58835787aa5831c4efbc669381941")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<close_skeleton-response>)))
  "Returns full string definition for message of type '<close_skeleton-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'close_skeleton-response)))
  "Returns full string definition for message of type 'close_skeleton-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <close_skeleton-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <close_skeleton-response>))
  "Converts a ROS message object to a list"
  (cl:list 'close_skeleton-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'close_skeleton)))
  'close_skeleton-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'close_skeleton)))
  'close_skeleton-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'close_skeleton)))
  "Returns string type for a service object of type '<close_skeleton>"
  "upperbodycore_msgs/close_skeleton")