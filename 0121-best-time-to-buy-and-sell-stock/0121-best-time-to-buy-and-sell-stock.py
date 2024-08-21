class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        min_num = prices[0]
        max_profit = 0
        
        for i in range(1, len(prices)):
            if prices[i] < min_num:
                min_num = prices[i]
                
            profit = prices[i] - min_num
            
            if(profit > max_profit):
                max_profit = profit
                
        return max_profit