function  scaled=my_mapfunction(unscaledNum, minAllowed, maxAllowed, min, max)
 scaled=(maxAllowed - minAllowed) * (unscaledNum - min) / (max - min) + minAllowed;
end