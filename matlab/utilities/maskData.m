function outputDataVec = maskData(inputData, mask) 
    % Use the mask to return the a 2D vector of voxels X time. 
    % mask is a 3D (probably) size logical matrix. 
    % inputData is a voxel x time vector, where X == sum(mask, 'all')

    % this may be necessary?
    mask = logical(mask);
    if size(inputData,4) == 1
        % this is a single volume, easy, 
        outputDataVec = inputData(mask);
    elseif size(inputData,4) > 1
        % this is a 4d volume...how do to do that...
        tempMask = repmat(mask, 1,1,1, size(inputData,4));
        outputDataVec = reshape(inputData(tempMask), [], size(inputData,4));
    end

