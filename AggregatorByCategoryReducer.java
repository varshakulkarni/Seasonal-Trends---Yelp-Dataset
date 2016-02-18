package sentimentAnalysis.edu.utd;

import java.io.IOException;
import java.util.Iterator;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapreduce.Reducer;

public class AggregatorByCategoryReducer extends
			Reducer<TextPair, IntWritable, TextPair, IntWritable> {

		private final static IntWritable SumValue = new IntWritable();

		@Override
		public void reduce(TextPair key, Iterable<IntWritable> values, Context context)
				throws IOException, InterruptedException {
			Iterator<IntWritable> iter = values.iterator();
			int sum = 0;
			while (iter.hasNext()) {
				sum += iter.next().get();
			}

			SumValue.set(sum);
			context.write(key, SumValue);
		}
	}

