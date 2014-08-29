; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude skeletonSrv-request.msg.html

(cl:defclass <skeletonSrv-request> (roslisp-msg-protocol:ros-message)
  ((requ
    :reader requ
    :initarg :requ
    :type cl:boolean
    :initform cl:nil)
   (id
    :reader id
    :initarg :id
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass skeletonSrv-request (<skeletonSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <skeletonSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'skeletonSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<skeletonSrv-request> is deprecated: use upperbodycore_msgs-srv:skeletonSrv-request instead.")))

(cl:ensure-generic-function 'requ-val :lambda-list '(m))
(cl:defmethod requ-val ((m <skeletonSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:requ-val is deprecated.  Use upperbodycore_msgs-srv:requ instead.")
  (requ m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <skeletonSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:id-val is deprecated.  Use upperbodycore_msgs-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <skeletonSrv-request>) ostream)
  "Serializes a message object of type '<skeletonSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'requ) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'id) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <skeletonSrv-request>) istream)
  "Deserializes a message object of type '<skeletonSrv-request>"
    (cl:setf (cl:slot-value msg 'requ) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'id) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<skeletonSrv-request>)))
  "Returns string type for a service object of type '<skeletonSrv-request>"
  "upperbodycore_msgs/skeletonSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'skeletonSrv-request)))
  "Returns string type for a service object of type 'skeletonSrv-request"
  "upperbodycore_msgs/skeletonSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<skeletonSrv-request>)))
  "Returns md5sum for a message object of type '<skeletonSrv-request>"
  "ad7943a0c2da8e16dd358be05ffacd94")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'skeletonSrv-request)))
  "Returns md5sum for a message object of type 'skeletonSrv-request"
  "ad7943a0c2da8e16dd358be05ffacd94")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<skeletonSrv-request>)))
  "Returns full string definition for message of type '<skeletonSrv-request>"
  (cl:format cl:nil "bool requ~%bool id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'skeletonSrv-request)))
  "Returns full string definition for message of type 'skeletonSrv-request"
  (cl:format cl:nil "bool requ~%bool id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <skeletonSrv-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <skeletonSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'skeletonSrv-request
    (cl:cons ':requ (requ msg))
    (cl:cons ':id (id msg))
))
;//! \htmlinclude skeletonSrv-response.msg.html

(cl:defclass <skeletonSrv-response> (roslisp-msg-protocol:ros-message)
  ((resule
    :reader resule
    :initarg :resule
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass skeletonSrv-response (<skeletonSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <skeletonSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'skeletonSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<skeletonSrv-response> is deprecated: use upperbodycore_msgs-srv:skeletonSrv-response instead.")))

(cl:ensure-generic-function 'resule-val :lambda-list '(m))
(cl:defmethod resule-val ((m <skeletonSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:resule-val is deprecated.  Use upperbodycore_msgs-srv:resule instead.")
  (resule m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <skeletonSrv-response>) ostream)
  "Serializes a message object of type '<skeletonSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resule) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <skeletonSrv-response>) istream)
  "Deserializes a message object of type '<skeletonSrv-response>"
    (cl:setf (cl:slot-value msg 'resule) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<skeletonSrv-response>)))
  "Returns string type for a service object of type '<skeletonSrv-response>"
  "upperbodycore_msgs/skeletonSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'skeletonSrv-response)))
  "Returns string type for a service object of type 'skeletonSrv-response"
  "upperbodycore_msgs/skeletonSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<skeletonSrv-response>)))
  "Returns md5sum for a message object of type '<skeletonSrv-response>"
  "ad7943a0c2da8e16dd358be05ffacd94")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'skeletonSrv-response)))
  "Returns md5sum for a message object of type 'skeletonSrv-response"
  "ad7943a0c2da8e16dd358be05ffacd94")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<skeletonSrv-response>)))
  "Returns full string definition for message of type '<skeletonSrv-response>"
  (cl:format cl:nil "bool resule~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'skeletonSrv-response)))
  "Returns full string definition for message of type 'skeletonSrv-response"
  (cl:format cl:nil "bool resule~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <skeletonSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <skeletonSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'skeletonSrv-response
    (cl:cons ':resule (resule msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'skeletonSrv)))
  'skeletonSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'skeletonSrv)))
  'skeletonSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'skeletonSrv)))
  "Returns string type for a service object of type '<skeletonSrv>"
  "upperbodycore_msgs/skeletonSrv")