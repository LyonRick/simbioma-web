export default function BlogLoading() {
    return (
        <div className="container mx-auto px-4 py-24">
            <div className="text-center max-w-3xl mx-auto mb-16">
                {/* Title Skeleton */}
                <div className="h-12 bg-gray-200 rounded-lg w-2/3 mx-auto mb-6 animate-pulse"></div>
                {/* Subtitle Skeleton */}
                <div className="h-6 bg-gray-200 rounded-lg w-3/4 mx-auto animate-pulse"></div>
            </div>

            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                {[1, 2, 3].map((i) => (
                    <div
                        key={i}
                        className="bg-white rounded-2xl overflow-hidden shadow-lg border border-gray-100"
                    >
                        {/* Image Skeleton */}
                        <div className="h-48 bg-gray-200 animate-pulse"></div>

                        <div className="p-6">
                            {/* Meta Skeleton */}
                            <div className="flex items-center gap-4 mb-4">
                                <div className="h-3 w-20 bg-gray-200 rounded animate-pulse"></div>
                                <div className="h-3 w-24 bg-gray-200 rounded animate-pulse"></div>
                            </div>

                            {/* Title Skeleton */}
                            <div className="space-y-2 mb-4">
                                <div className="h-5 bg-gray-200 rounded animate-pulse"></div>
                                <div className="h-5 bg-gray-200 rounded w-4/5 animate-pulse"></div>
                            </div>

                            {/* Excerpt Skeleton */}
                            <div className="space-y-2 mb-6">
                                <div className="h-4 bg-gray-200 rounded animate-pulse"></div>
                                <div className="h-4 bg-gray-200 rounded animate-pulse"></div>
                                <div className="h-4 bg-gray-200 rounded w-2/3 animate-pulse"></div>
                            </div>

                            {/* Button Skeleton */}
                            <div className="h-4 w-24 bg-gray-200 rounded animate-pulse"></div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
}
