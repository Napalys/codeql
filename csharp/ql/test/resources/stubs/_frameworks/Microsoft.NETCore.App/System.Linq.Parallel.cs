// This file contains auto-generated code.
// Generated from `System.Linq.Parallel, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a`.
namespace System
{
    namespace Linq
    {
        public class OrderedParallelQuery<TSource> : System.Linq.ParallelQuery<TSource>
        {
            public override System.Collections.Generic.IEnumerator<TSource> GetEnumerator() => throw null;
        }
        public static class ParallelEnumerable
        {
            public static TSource Aggregate<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TSource, TSource> func) => throw null;
            public static TAccumulate Aggregate<TSource, TAccumulate>(this System.Linq.ParallelQuery<TSource> source, TAccumulate seed, System.Func<TAccumulate, TSource, TAccumulate> func) => throw null;
            public static TResult Aggregate<TSource, TAccumulate, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TAccumulate> seedFactory, System.Func<TAccumulate, TSource, TAccumulate> updateAccumulatorFunc, System.Func<TAccumulate, TAccumulate, TAccumulate> combineAccumulatorsFunc, System.Func<TAccumulate, TResult> resultSelector) => throw null;
            public static TResult Aggregate<TSource, TAccumulate, TResult>(this System.Linq.ParallelQuery<TSource> source, TAccumulate seed, System.Func<TAccumulate, TSource, TAccumulate> updateAccumulatorFunc, System.Func<TAccumulate, TAccumulate, TAccumulate> combineAccumulatorsFunc, System.Func<TAccumulate, TResult> resultSelector) => throw null;
            public static TResult Aggregate<TSource, TAccumulate, TResult>(this System.Linq.ParallelQuery<TSource> source, TAccumulate seed, System.Func<TAccumulate, TSource, TAccumulate> func, System.Func<TAccumulate, TResult> resultSelector) => throw null;
            public static bool All<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static bool Any<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static bool Any<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static System.Collections.Generic.IEnumerable<TSource> AsEnumerable<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static System.Linq.ParallelQuery AsOrdered(this System.Linq.ParallelQuery source) => throw null;
            public static System.Linq.ParallelQuery<TSource> AsOrdered<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static System.Linq.ParallelQuery AsParallel(this System.Collections.IEnumerable source) => throw null;
            public static System.Linq.ParallelQuery<TSource> AsParallel<TSource>(this System.Collections.Concurrent.Partitioner<TSource> source) => throw null;
            public static System.Linq.ParallelQuery<TSource> AsParallel<TSource>(this System.Collections.Generic.IEnumerable<TSource> source) => throw null;
            public static System.Collections.Generic.IEnumerable<TSource> AsSequential<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static System.Linq.ParallelQuery<TSource> AsUnordered<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static decimal Average(this System.Linq.ParallelQuery<decimal> source) => throw null;
            public static double Average(this System.Linq.ParallelQuery<double> source) => throw null;
            public static double Average(this System.Linq.ParallelQuery<int> source) => throw null;
            public static double Average(this System.Linq.ParallelQuery<long> source) => throw null;
            public static decimal? Average(this System.Linq.ParallelQuery<decimal?> source) => throw null;
            public static double? Average(this System.Linq.ParallelQuery<double?> source) => throw null;
            public static double? Average(this System.Linq.ParallelQuery<int?> source) => throw null;
            public static double? Average(this System.Linq.ParallelQuery<long?> source) => throw null;
            public static float? Average(this System.Linq.ParallelQuery<float?> source) => throw null;
            public static float Average(this System.Linq.ParallelQuery<float> source) => throw null;
            public static decimal Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, decimal> selector) => throw null;
            public static double Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, double> selector) => throw null;
            public static double Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int> selector) => throw null;
            public static double Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, long> selector) => throw null;
            public static decimal? Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, decimal?> selector) => throw null;
            public static double? Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, double?> selector) => throw null;
            public static double? Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int?> selector) => throw null;
            public static double? Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, long?> selector) => throw null;
            public static float? Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, float?> selector) => throw null;
            public static float Average<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, float> selector) => throw null;
            public static System.Linq.ParallelQuery<TResult> Cast<TResult>(this System.Linq.ParallelQuery source) => throw null;
            public static System.Linq.ParallelQuery<TSource> Concat<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second) => throw null;
            public static System.Linq.ParallelQuery<TSource> Concat<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second) => throw null;
            public static bool Contains<TSource>(this System.Linq.ParallelQuery<TSource> source, TSource value) => throw null;
            public static bool Contains<TSource>(this System.Linq.ParallelQuery<TSource> source, TSource value, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static int Count<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static int Count<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static System.Linq.ParallelQuery<TSource> DefaultIfEmpty<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static System.Linq.ParallelQuery<TSource> DefaultIfEmpty<TSource>(this System.Linq.ParallelQuery<TSource> source, TSource defaultValue) => throw null;
            public static System.Linq.ParallelQuery<TSource> Distinct<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static System.Linq.ParallelQuery<TSource> Distinct<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static TSource ElementAt<TSource>(this System.Linq.ParallelQuery<TSource> source, int index) => throw null;
            public static TSource ElementAtOrDefault<TSource>(this System.Linq.ParallelQuery<TSource> source, int index) => throw null;
            public static System.Linq.ParallelQuery<TResult> Empty<TResult>() => throw null;
            public static System.Linq.ParallelQuery<TSource> Except<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second) => throw null;
            public static System.Linq.ParallelQuery<TSource> Except<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static System.Linq.ParallelQuery<TSource> Except<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second) => throw null;
            public static System.Linq.ParallelQuery<TSource> Except<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static TSource First<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static TSource First<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static TSource FirstOrDefault<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static TSource FirstOrDefault<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static void ForAll<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Action<TSource> action) => throw null;
            public static System.Linq.ParallelQuery<System.Linq.IGrouping<TKey, TSource>> GroupBy<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector) => throw null;
            public static System.Linq.ParallelQuery<System.Linq.IGrouping<TKey, TSource>> GroupBy<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<System.Linq.IGrouping<TKey, TElement>> GroupBy<TSource, TKey, TElement>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TSource, TElement> elementSelector) => throw null;
            public static System.Linq.ParallelQuery<System.Linq.IGrouping<TKey, TElement>> GroupBy<TSource, TKey, TElement>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TSource, TElement> elementSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<TResult> GroupBy<TSource, TKey, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TKey, System.Collections.Generic.IEnumerable<TSource>, TResult> resultSelector) => throw null;
            public static System.Linq.ParallelQuery<TResult> GroupBy<TSource, TKey, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TKey, System.Collections.Generic.IEnumerable<TSource>, TResult> resultSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<TResult> GroupBy<TSource, TKey, TElement, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TSource, TElement> elementSelector, System.Func<TKey, System.Collections.Generic.IEnumerable<TElement>, TResult> resultSelector) => throw null;
            public static System.Linq.ParallelQuery<TResult> GroupBy<TSource, TKey, TElement, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TSource, TElement> elementSelector, System.Func<TKey, System.Collections.Generic.IEnumerable<TElement>, TResult> resultSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<TResult> GroupJoin<TOuter, TInner, TKey, TResult>(this System.Linq.ParallelQuery<TOuter> outer, System.Collections.Generic.IEnumerable<TInner> inner, System.Func<TOuter, TKey> outerKeySelector, System.Func<TInner, TKey> innerKeySelector, System.Func<TOuter, System.Collections.Generic.IEnumerable<TInner>, TResult> resultSelector) => throw null;
            public static System.Linq.ParallelQuery<TResult> GroupJoin<TOuter, TInner, TKey, TResult>(this System.Linq.ParallelQuery<TOuter> outer, System.Collections.Generic.IEnumerable<TInner> inner, System.Func<TOuter, TKey> outerKeySelector, System.Func<TInner, TKey> innerKeySelector, System.Func<TOuter, System.Collections.Generic.IEnumerable<TInner>, TResult> resultSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<TResult> GroupJoin<TOuter, TInner, TKey, TResult>(this System.Linq.ParallelQuery<TOuter> outer, System.Linq.ParallelQuery<TInner> inner, System.Func<TOuter, TKey> outerKeySelector, System.Func<TInner, TKey> innerKeySelector, System.Func<TOuter, System.Collections.Generic.IEnumerable<TInner>, TResult> resultSelector) => throw null;
            public static System.Linq.ParallelQuery<TResult> GroupJoin<TOuter, TInner, TKey, TResult>(this System.Linq.ParallelQuery<TOuter> outer, System.Linq.ParallelQuery<TInner> inner, System.Func<TOuter, TKey> outerKeySelector, System.Func<TInner, TKey> innerKeySelector, System.Func<TOuter, System.Collections.Generic.IEnumerable<TInner>, TResult> resultSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<TSource> Intersect<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second) => throw null;
            public static System.Linq.ParallelQuery<TSource> Intersect<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static System.Linq.ParallelQuery<TSource> Intersect<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second) => throw null;
            public static System.Linq.ParallelQuery<TSource> Intersect<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static System.Linq.ParallelQuery<TResult> Join<TOuter, TInner, TKey, TResult>(this System.Linq.ParallelQuery<TOuter> outer, System.Collections.Generic.IEnumerable<TInner> inner, System.Func<TOuter, TKey> outerKeySelector, System.Func<TInner, TKey> innerKeySelector, System.Func<TOuter, TInner, TResult> resultSelector) => throw null;
            public static System.Linq.ParallelQuery<TResult> Join<TOuter, TInner, TKey, TResult>(this System.Linq.ParallelQuery<TOuter> outer, System.Collections.Generic.IEnumerable<TInner> inner, System.Func<TOuter, TKey> outerKeySelector, System.Func<TInner, TKey> innerKeySelector, System.Func<TOuter, TInner, TResult> resultSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<TResult> Join<TOuter, TInner, TKey, TResult>(this System.Linq.ParallelQuery<TOuter> outer, System.Linq.ParallelQuery<TInner> inner, System.Func<TOuter, TKey> outerKeySelector, System.Func<TInner, TKey> innerKeySelector, System.Func<TOuter, TInner, TResult> resultSelector) => throw null;
            public static System.Linq.ParallelQuery<TResult> Join<TOuter, TInner, TKey, TResult>(this System.Linq.ParallelQuery<TOuter> outer, System.Linq.ParallelQuery<TInner> inner, System.Func<TOuter, TKey> outerKeySelector, System.Func<TInner, TKey> innerKeySelector, System.Func<TOuter, TInner, TResult> resultSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static TSource Last<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static TSource Last<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static TSource LastOrDefault<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static TSource LastOrDefault<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static long LongCount<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static long LongCount<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static decimal Max(this System.Linq.ParallelQuery<decimal> source) => throw null;
            public static double Max(this System.Linq.ParallelQuery<double> source) => throw null;
            public static int Max(this System.Linq.ParallelQuery<int> source) => throw null;
            public static long Max(this System.Linq.ParallelQuery<long> source) => throw null;
            public static decimal? Max(this System.Linq.ParallelQuery<decimal?> source) => throw null;
            public static double? Max(this System.Linq.ParallelQuery<double?> source) => throw null;
            public static int? Max(this System.Linq.ParallelQuery<int?> source) => throw null;
            public static long? Max(this System.Linq.ParallelQuery<long?> source) => throw null;
            public static float? Max(this System.Linq.ParallelQuery<float?> source) => throw null;
            public static float Max(this System.Linq.ParallelQuery<float> source) => throw null;
            public static TSource Max<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static decimal Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, decimal> selector) => throw null;
            public static double Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, double> selector) => throw null;
            public static int Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int> selector) => throw null;
            public static long Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, long> selector) => throw null;
            public static decimal? Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, decimal?> selector) => throw null;
            public static double? Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, double?> selector) => throw null;
            public static int? Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int?> selector) => throw null;
            public static long? Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, long?> selector) => throw null;
            public static float? Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, float?> selector) => throw null;
            public static float Max<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, float> selector) => throw null;
            public static TResult Max<TSource, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TResult> selector) => throw null;
            public static decimal Min(this System.Linq.ParallelQuery<decimal> source) => throw null;
            public static double Min(this System.Linq.ParallelQuery<double> source) => throw null;
            public static int Min(this System.Linq.ParallelQuery<int> source) => throw null;
            public static long Min(this System.Linq.ParallelQuery<long> source) => throw null;
            public static decimal? Min(this System.Linq.ParallelQuery<decimal?> source) => throw null;
            public static double? Min(this System.Linq.ParallelQuery<double?> source) => throw null;
            public static int? Min(this System.Linq.ParallelQuery<int?> source) => throw null;
            public static long? Min(this System.Linq.ParallelQuery<long?> source) => throw null;
            public static float? Min(this System.Linq.ParallelQuery<float?> source) => throw null;
            public static float Min(this System.Linq.ParallelQuery<float> source) => throw null;
            public static TSource Min<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static decimal Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, decimal> selector) => throw null;
            public static double Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, double> selector) => throw null;
            public static int Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int> selector) => throw null;
            public static long Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, long> selector) => throw null;
            public static decimal? Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, decimal?> selector) => throw null;
            public static double? Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, double?> selector) => throw null;
            public static int? Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int?> selector) => throw null;
            public static long? Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, long?> selector) => throw null;
            public static float? Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, float?> selector) => throw null;
            public static float Min<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, float> selector) => throw null;
            public static TResult Min<TSource, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TResult> selector) => throw null;
            public static System.Linq.ParallelQuery<TResult> OfType<TResult>(this System.Linq.ParallelQuery source) => throw null;
            public static System.Linq.OrderedParallelQuery<TSource> OrderBy<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector) => throw null;
            public static System.Linq.OrderedParallelQuery<TSource> OrderBy<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Collections.Generic.IComparer<TKey> comparer) => throw null;
            public static System.Linq.OrderedParallelQuery<TSource> OrderByDescending<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector) => throw null;
            public static System.Linq.OrderedParallelQuery<TSource> OrderByDescending<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Collections.Generic.IComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<int> Range(int start, int count) => throw null;
            public static System.Linq.ParallelQuery<TResult> Repeat<TResult>(TResult element, int count) => throw null;
            public static System.Linq.ParallelQuery<TSource> Reverse<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static System.Linq.ParallelQuery<TResult> Select<TSource, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int, TResult> selector) => throw null;
            public static System.Linq.ParallelQuery<TResult> Select<TSource, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TResult> selector) => throw null;
            public static System.Linq.ParallelQuery<TResult> SelectMany<TSource, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, System.Collections.Generic.IEnumerable<TResult>> selector) => throw null;
            public static System.Linq.ParallelQuery<TResult> SelectMany<TSource, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int, System.Collections.Generic.IEnumerable<TResult>> selector) => throw null;
            public static System.Linq.ParallelQuery<TResult> SelectMany<TSource, TCollection, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, System.Collections.Generic.IEnumerable<TCollection>> collectionSelector, System.Func<TSource, TCollection, TResult> resultSelector) => throw null;
            public static System.Linq.ParallelQuery<TResult> SelectMany<TSource, TCollection, TResult>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int, System.Collections.Generic.IEnumerable<TCollection>> collectionSelector, System.Func<TSource, TCollection, TResult> resultSelector) => throw null;
            public static bool SequenceEqual<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second) => throw null;
            public static bool SequenceEqual<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static bool SequenceEqual<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second) => throw null;
            public static bool SequenceEqual<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static TSource Single<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static TSource Single<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static TSource SingleOrDefault<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static TSource SingleOrDefault<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static System.Linq.ParallelQuery<TSource> Skip<TSource>(this System.Linq.ParallelQuery<TSource> source, int count) => throw null;
            public static System.Linq.ParallelQuery<TSource> SkipWhile<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static System.Linq.ParallelQuery<TSource> SkipWhile<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int, bool> predicate) => throw null;
            public static decimal Sum(this System.Linq.ParallelQuery<decimal> source) => throw null;
            public static double Sum(this System.Linq.ParallelQuery<double> source) => throw null;
            public static int Sum(this System.Linq.ParallelQuery<int> source) => throw null;
            public static long Sum(this System.Linq.ParallelQuery<long> source) => throw null;
            public static decimal? Sum(this System.Linq.ParallelQuery<decimal?> source) => throw null;
            public static double? Sum(this System.Linq.ParallelQuery<double?> source) => throw null;
            public static int? Sum(this System.Linq.ParallelQuery<int?> source) => throw null;
            public static long? Sum(this System.Linq.ParallelQuery<long?> source) => throw null;
            public static float? Sum(this System.Linq.ParallelQuery<float?> source) => throw null;
            public static float Sum(this System.Linq.ParallelQuery<float> source) => throw null;
            public static decimal Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, decimal> selector) => throw null;
            public static double Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, double> selector) => throw null;
            public static int Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int> selector) => throw null;
            public static long Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, long> selector) => throw null;
            public static decimal? Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, decimal?> selector) => throw null;
            public static double? Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, double?> selector) => throw null;
            public static int? Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int?> selector) => throw null;
            public static long? Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, long?> selector) => throw null;
            public static float? Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, float?> selector) => throw null;
            public static float Sum<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, float> selector) => throw null;
            public static System.Linq.ParallelQuery<TSource> Take<TSource>(this System.Linq.ParallelQuery<TSource> source, int count) => throw null;
            public static System.Linq.ParallelQuery<TSource> TakeWhile<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static System.Linq.ParallelQuery<TSource> TakeWhile<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int, bool> predicate) => throw null;
            public static System.Linq.OrderedParallelQuery<TSource> ThenBy<TSource, TKey>(this System.Linq.OrderedParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector) => throw null;
            public static System.Linq.OrderedParallelQuery<TSource> ThenBy<TSource, TKey>(this System.Linq.OrderedParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Collections.Generic.IComparer<TKey> comparer) => throw null;
            public static System.Linq.OrderedParallelQuery<TSource> ThenByDescending<TSource, TKey>(this System.Linq.OrderedParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector) => throw null;
            public static System.Linq.OrderedParallelQuery<TSource> ThenByDescending<TSource, TKey>(this System.Linq.OrderedParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Collections.Generic.IComparer<TKey> comparer) => throw null;
            public static TSource[] ToArray<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static System.Collections.Generic.Dictionary<TKey, TSource> ToDictionary<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector) => throw null;
            public static System.Collections.Generic.Dictionary<TKey, TSource> ToDictionary<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Collections.Generic.Dictionary<TKey, TElement> ToDictionary<TSource, TKey, TElement>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TSource, TElement> elementSelector) => throw null;
            public static System.Collections.Generic.Dictionary<TKey, TElement> ToDictionary<TSource, TKey, TElement>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TSource, TElement> elementSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Collections.Generic.List<TSource> ToList<TSource>(this System.Linq.ParallelQuery<TSource> source) => throw null;
            public static System.Linq.ILookup<TKey, TSource> ToLookup<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector) => throw null;
            public static System.Linq.ILookup<TKey, TSource> ToLookup<TSource, TKey>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ILookup<TKey, TElement> ToLookup<TSource, TKey, TElement>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TSource, TElement> elementSelector) => throw null;
            public static System.Linq.ILookup<TKey, TElement> ToLookup<TSource, TKey, TElement>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, TKey> keySelector, System.Func<TSource, TElement> elementSelector, System.Collections.Generic.IEqualityComparer<TKey> comparer) => throw null;
            public static System.Linq.ParallelQuery<TSource> Union<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second) => throw null;
            public static System.Linq.ParallelQuery<TSource> Union<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Collections.Generic.IEnumerable<TSource> second, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static System.Linq.ParallelQuery<TSource> Union<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second) => throw null;
            public static System.Linq.ParallelQuery<TSource> Union<TSource>(this System.Linq.ParallelQuery<TSource> first, System.Linq.ParallelQuery<TSource> second, System.Collections.Generic.IEqualityComparer<TSource> comparer) => throw null;
            public static System.Linq.ParallelQuery<TSource> Where<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, bool> predicate) => throw null;
            public static System.Linq.ParallelQuery<TSource> Where<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Func<TSource, int, bool> predicate) => throw null;
            public static System.Linq.ParallelQuery<TSource> WithCancellation<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Threading.CancellationToken cancellationToken) => throw null;
            public static System.Linq.ParallelQuery<TSource> WithDegreeOfParallelism<TSource>(this System.Linq.ParallelQuery<TSource> source, int degreeOfParallelism) => throw null;
            public static System.Linq.ParallelQuery<TSource> WithExecutionMode<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Linq.ParallelExecutionMode executionMode) => throw null;
            public static System.Linq.ParallelQuery<TSource> WithMergeOptions<TSource>(this System.Linq.ParallelQuery<TSource> source, System.Linq.ParallelMergeOptions mergeOptions) => throw null;
            public static System.Linq.ParallelQuery<TResult> Zip<TFirst, TSecond, TResult>(this System.Linq.ParallelQuery<TFirst> first, System.Collections.Generic.IEnumerable<TSecond> second, System.Func<TFirst, TSecond, TResult> resultSelector) => throw null;
            public static System.Linq.ParallelQuery<TResult> Zip<TFirst, TSecond, TResult>(this System.Linq.ParallelQuery<TFirst> first, System.Linq.ParallelQuery<TSecond> second, System.Func<TFirst, TSecond, TResult> resultSelector) => throw null;
        }
        public enum ParallelExecutionMode
        {
            Default = 0,
            ForceParallelism = 1,
        }
        public enum ParallelMergeOptions
        {
            Default = 0,
            NotBuffered = 1,
            AutoBuffered = 2,
            FullyBuffered = 3,
        }
        public class ParallelQuery : System.Collections.IEnumerable
        {
            System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator() => throw null;
        }
        public class ParallelQuery<TSource> : System.Linq.ParallelQuery, System.Collections.Generic.IEnumerable<TSource>, System.Collections.IEnumerable
        {
            public virtual System.Collections.Generic.IEnumerator<TSource> GetEnumerator() => throw null;
        }
    }
}
