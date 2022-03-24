function outputData = unMaskData(inputData, mask)
    % Use the mask to return the vectorized data into its full 3D/4D state. 
    % mask is a 3D (probably) size logical matrix. 
    % inputData is a voxel x time vector, where X == sum(mask, 'all')

    mask = logical(mask);
    if size(inputData,2) == 1
        % this is a single volume, easy,
        outputData = zeros(size(mask));
        outputData(mask) = inputData; 
        
    elseif size(inputData,2) > 1
        % this is a 4d volume...how do to do that...
        outputData = zeros([size(mask), size(inputData,2)]);
        tempMask = repmat(mask, 1,1,1, size(inputData,2));
        outputData(tempMask) = inputData;
    end


