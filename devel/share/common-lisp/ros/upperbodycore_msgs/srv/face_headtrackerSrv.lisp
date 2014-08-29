; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude face_headtrackerSrv-request.msg.html

(cl:defclass <face_headtrackerSrv-request> (roslisp-msg-protocol:ros-message)
  ((head_tracker
    :reader head_tracker
    :initarg :head_tracker
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass face_headtrackerSrv-request (<face_headtrackerSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <face_headtrackerSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'face_headtrackerSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<face_headtrackerSrv-request> is deprecated: use upperbodycore_msgs-srv:face_headtrackerSrv-request instead.")))

(cl:ensure-generic-function 'head_tracker-val :lambda-list '(m))
(cl:defmethod head_tracker-val ((m <face_headtrackerSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:head_tracker-val is deprecated.  Use upperbodycore_msgs-srv:head_tracker instead.")
  (head_tracker m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <face_headtrackerSrv-request>) ostream)
  "Serializes a message object of type '<face_headtrackerSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'head_tracker) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <face_headtrackerSrv-request>) istream)
  "Deserializes a message object of type '<face_headtrackerSrv-request>"
    (cl:setf (cl:slot-value msg 'head_tracker) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<face_headtrackerSrv-request>)))
  "Returns string type for a service object of type '<face_headtrackerSrv-request>"
  "upperbodycore_msgs/face_headtrackerSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'face_headtrackerSrv-request)))
  "Returns string type for a service object of type 'face_headtrackerSrv-request"
  "upperbodycore_msgs/face_headtrackerSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<face_headtrackerSrv-request>)))
  "Returns md5sum for a message object of type '<face_headtrackerSrv-request>"
  "6c4bf1e85b9455b7bbb934e94bf6222b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'face_headtrackerSrv-request)))
  "Returns md5sum for a message object of type 'face_headtrackerSrv-request"
  "6c4bf1e85b9455b7bbb934e94bf6222b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<face_headtrackerSrv-request>)))
  "Returns full string definition for message of type '<face_headtrackerSrv-request>"
  (cl:format cl:nil "bool head_tracker~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'face_headtrackerSrv-request)))
  "Returns full string definition for message of type 'face_headtrackerSrv-request"
  (cl:format cl:nil "bool head_tracker~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <face_headtrackerSrv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <face_headtrackerSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'face_headtrackerSrv-request
    (cl:cons ':head_tracker (head_tracker msg))
))
;//! \htmlinclude face_headtrackerSrv-response.msg.html

(cl:defclass <face_headtrackerSrv-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass face_headtrackerSrv-response (<face_headtrackerSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <face_headtrackerSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'face_headtrackerSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<face_headtrackerSrv-response> is deprecated: use upperbodycore_msgs-srv:face_headtrackerSrv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <face_headtrackerSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <face_headtrackerSrv-response>) ostream)
  "Serializes a message object of type '<face_headtrackerSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <face_headtrackerSrv-response>) istream)
  "Deserializes a message object of type '<face_headtrackerSrv-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<face_headtrackerSrv-response>)))
  "Returns string type for a service object of type '<face_headtrackerSrv-response>"
  "upperbodycore_msgs/face_headtrackerSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'face_headtrackerSrv-response)))
  "Returns string type for a service object of type 'face_headtrackerSrv-response"
  "upperbodycore_msgs/face_headtrackerSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<face_headtrackerSrv-response>)))
  "Returns md5sum for a message object of type '<face_headtrackerSrv-response>"
  "6c4bf1e85b9455b7bbb934e94bf6222b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'face_headtrackerSrv-response)))
  "Returns md5sum for a message object of type 'face_headtrackerSrv-response"
  "6c4bf1e85b9455b7bbb934e94bf6222b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<face_headtrackerSrv-response>)))
  "Returns full string definition for message of type '<face_headtrackerSrv-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'face_headtrackerSrv-response)))
  "Returns full string definition for message of type 'face_headtrackerSrv-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <face_headtrackerSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <face_headtrackerSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'face_headtrackerSrv-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'face_headtrackerSrv)))
  'face_headtrackerSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'face_headtrackerSrv)))
  'face_headtrackerSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'face_headtrackerSrv)))
  "Returns string type for a service object of type '<face_headtrackerSrv>"
  "upperbodycore_msgs/face_headtrackerSrv")