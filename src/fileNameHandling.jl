## File Name Handlers

function cache_skyname(intup)
    (tele,field,plate,mjd,file,plateFile,fiberindx) = intup
    join(["local_cache",join(["sky",tele,field,plate,mjd],"_")],"/")*".jdat"
end

function cache_starname(intup)
    (tele,field,plate,mjd,file,plateFile,fiberindx) = intup
    join(["local_cache",join(["star",tele,field,plate,mjd,fiberindx],"_")],"/")*".jdat"
end

function getFramesFromPlate(x)
    f = FITS(x)
    framenum = read(f[14],"FRAMENUM")
    close(f)
    return framenum
end

function build_framepath(mjd,imid,chip)
    imids = lpad(imid,8,"0")
    base = "/uufs/chpc.utah.edu/common/home/sdss/dr17/apogee/spectro/redux/dr17/exposures/apogee-n"
    fname = "ap1D-$chip-$imids"*".fits"
    return join([base,mjd,fname],"/")
end

function visit2cframe(fname,imid,chip)
    imids = lpad(imid,8,"0")
    file = "apCframe-$chip-$imids"*".fits"
    sname = split(fname,"/")
    sname[end] = file
    return join(sname,"/")
end
