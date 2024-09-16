using System;
using System.Text;

namespace CodeCharm
{
    public static class DateTimeFormattingExtensions
    {
        public static string ToPhrase(this TimeSpan remainingTime, bool removeZeroTrailing = false)
        {
            var isNegative = remainingTime < TimeSpan.Zero;
            var remainingDays = Math.Abs(remainingTime.TotalDays);
            var hasDays = remainingDays >= 1;
            var remainingHours = Math.Abs(remainingTime.Hours);
            var hasHours = remainingHours > 0;
            var remainingMinutes = Math.Abs(remainingTime.Minutes);
            var hasMinutes = remainingMinutes > 0;
            var formatBuilder = new StringBuilder();
            if (isNegative)
            {
                formatBuilder.Append(@"\-");
            }
            if (hasDays)
            {
                formatBuilder.Append(@"d\ \d\a\y\s");
                if (!(removeZeroTrailing && (!(hasHours || hasMinutes))))
                {
                    formatBuilder.Append(@"\,\ ");
                }
            }
            if (!(removeZeroTrailing && hasDays && !hasHours && !hasMinutes))
            {
                formatBuilder.Append(@"h\ \h\r\s");
                if (!(removeZeroTrailing && !hasMinutes))
                {
                    formatBuilder.Append(@"\,\ ");
                }
            }
            if (!(removeZeroTrailing && (hasDays || hasHours) && !hasMinutes))
            {
                formatBuilder.Append(@"m\ \m\i\n");
            }
            var format = formatBuilder.ToString();
            return remainingTime.ToString(format);
        }

    }
}