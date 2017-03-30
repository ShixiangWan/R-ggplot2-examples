
#### 1. Tensorflow实现最简单的Softmax Regression手写数字图片识别


```python
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data

gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction = 0.1)
sess = tf.InteractiveSession(config = tf.ConfigProto(gpu_options = gpu_options))

x = tf.placeholder(tf.float32, [None, 784])
W = tf.Variable(tf.zeros([784, 10]))
b = tf.Variable(tf.zeros([10]))
y = tf.nn.softmax(tf.matmul(x, W) + b)

y_ = tf.placeholder(tf.float32, [None, 10])
cross_entropy = tf.reduce_mean(-tf.reduce_sum(y_ * tf.log(y), reduction_indices=[1]))

train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy)
tf.global_variables_initializer().run()

mnist = input_data.read_data_sets("../data/hand_image/", one_hot=True)
for i in range(10000):
    batch_xs, batch_ys = mnist.train.next_batch(100)
    train_step.run({x: batch_xs, y_: batch_ys})
print '>> train finished'

correct_prediction = tf.equal(tf.arg_max(y, 1), tf.arg_max(y_, 1))
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
print accuracy.eval({x: mnist.test.images, y_: mnist.test.labels})
```

    Extracting ../data/hand_image/train-images-idx3-ubyte.gz
    Extracting ../data/hand_image/train-labels-idx1-ubyte.gz
    Extracting ../data/hand_image/t10k-images-idx3-ubyte.gz
    Extracting ../data/hand_image/t10k-labels-idx1-ubyte.gz
    >> train finished
    0.9238


#### 2. Tensorflow实现自编码器

首先，我们通过tf.random_uniform创建$\left( {{\rm{ - }}\sqrt {\frac{6}{{{n_{in}} + {n_{out}}}}} ,\sqrt {\frac{6}{{{n_{in}} + {n_{out}}}}} } \right)$范围内的均匀分布，而根据它的方差公式$D(x) = \frac{{{{(max - min)}^2}}}{{12}}$刚好等于$\frac{2}{{{n_{in}} + {n_{out}}}}$，因此这里实现的就是标准的均匀分布的Xaiver初始化器，其中$fan\_in$是输入节点的数量，$fan\_out$是输出节点的数量。


```python
import numpy as np
import sklearn.preprocessing as prep
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data

def xavier_init(fan_in, fan_out, constant=1):
    low = -constant * np.sqrt(6.0 / (fan_in + fan_out))
    high = constant * np.sqrt(6.0 / (fan_in + fan_out))
    return tf.random_uniform((fan_in, fan_out), 
                            minval = low, maxval = high,
                            dtype = tf.float32)
    







```
