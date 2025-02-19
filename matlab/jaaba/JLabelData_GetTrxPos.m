% [x,y,theta,a,b] = GetTrxPos1(obj,expi,fly,ts)
% Returns the position for the input experiment, SINGLE fly, and
% frames. If ts is not input, then all frames are returned.
function pos = JLabelData_GetTrxPos(obj,expi,fly,ts)

pos = struct;

if all(expi ~= obj.expi),
    % TODO: generalize to multiple flies
    [success,msg] = obj.PreLoad(expi,fly);
    % MK 20190302: PreLoad doesn't exist anymore. It should be
    % setCurrentTarget. But since JAABA doesn't error out I guess this is ok.
    if ~success,
        error('Error loading trx for experiment %d: %s',expi,msg);
    end
end

switch obj.targettype,
    
    
    case 'ant',
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = obj.trx(fly).a;
            pos.b = obj.trx(fly).b;
            return;
        end
        
        pos.x = obj.trx(fly).x(ts + obj.trx(fly).off);
        pos.y = obj.trx(fly).y(ts + obj.trx(fly).off);
        pos.theta = obj.trx(fly).theta(ts + obj.trx(fly).off);
        pos.a = obj.trx(fly).a(ts + obj.trx(fly).off);
        pos.b = obj.trx(fly).b(ts + obj.trx(fly).off);
        
        
    case 'fly',
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = obj.trx(fly).a;
            pos.b = obj.trx(fly).b;
            return;
        end
        
        pos.x = obj.trx(fly).x(ts + obj.trx(fly).off);
        pos.y = obj.trx(fly).y(ts + obj.trx(fly).off);
        pos.theta = obj.trx(fly).theta(ts + obj.trx(fly).off);
        pos.a = obj.trx(fly).a(ts + obj.trx(fly).off);
        pos.b = obj.trx(fly).b(ts + obj.trx(fly).off);
        
    case 'larva',
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.skeletonx = obj.trx(fly).skeletonx;
            pos.skeletony = obj.trx(fly).skeletony;
            return;
        end
        
        pos.x = obj.trx(fly).x(ts + obj.trx(fly).off);
        pos.y = obj.trx(fly).y(ts + obj.trx(fly).off);
        if isfield(obj.trx,'skeletonx'),
            pos.skeletonx = obj.trx(fly).skeletonx(:,ts + obj.trx(fly).off);
            pos.skeletony = obj.trx(fly).skeletony(:,ts + obj.trx(fly).off);
        else
            pos.xspine = obj.trx(fly).xspine(:,ts + obj.trx(fly).off);
            pos.yspine = obj.trx(fly).yspine(:,ts + obj.trx(fly).off);
        end
        
        
    case 'wingedfly',
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = obj.trx(fly).a;
            pos.b = obj.trx(fly).b;
            pos.xwingl = obj.trx(fly).xwingl;
            pos.ywingl = obj.trx(fly).ywingl;
            pos.xwingr = obj.trx(fly).xwingr;
            pos.ywingr = obj.trx(fly).ywingr;
            return;
        end
        
        pos.x = obj.trx(fly).x(ts + obj.trx(fly).off);
        pos.y = obj.trx(fly).y(ts + obj.trx(fly).off);
        pos.theta = obj.trx(fly).theta(ts + obj.trx(fly).off);
        pos.a = obj.trx(fly).a(ts + obj.trx(fly).off);
        pos.b = obj.trx(fly).b(ts + obj.trx(fly).off);
        pos.xwingl = obj.trx(fly).xwingl(ts + obj.trx(fly).off);
        pos.ywingl = obj.trx(fly).ywingl(ts + obj.trx(fly).off);
        pos.xwingr = obj.trx(fly).xwingr(ts + obj.trx(fly).off);
        pos.ywingr = obj.trx(fly).ywingr(ts + obj.trx(fly).off);
        
    case 'larvacontour',
        
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = obj.trx(fly).a;
            pos.b = obj.trx(fly).b;
            pos.xcontour = obj.trx(fly).xcontour;
            pos.ycontour = obj.trx(fly).ycontour;
            
            if all(isfield(obj.trx,{'xspine','yspine'})),
                pos.xspine = obj.trx(fly).xspine;
                pos.yspine = obj.trx(fly).yspine;
            end
            
            return;
        end
        
        pos.x = obj.trx(fly).x(ts + obj.trx(fly).off);
        pos.y = obj.trx(fly).y(ts + obj.trx(fly).off);
        pos.theta = obj.trx(fly).theta(ts + obj.trx(fly).off);
        pos.a = obj.trx(fly).a(ts + obj.trx(fly).off);
        pos.b = obj.trx(fly).b(ts + obj.trx(fly).off);
        pos.xcontour = obj.trx(fly).xcontour{ts + obj.trx(fly).off};
        pos.ycontour = obj.trx(fly).ycontour{ts + obj.trx(fly).off};
        
        if all(isfield(obj.trx,{'xspine','yspine'})),
            pos.xspine = obj.trx(fly).xspine(:,ts + obj.trx(fly).off);
            pos.yspine = obj.trx(fly).yspine(:,ts + obj.trx(fly).off);
        end
        
    case 'larvasamuel',
        
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = obj.trx(fly).a;
            pos.b = obj.trx(fly).b;
            pos.xcontour = obj.trx(fly).xcontour;
            pos.ycontour = obj.trx(fly).ycontour;
            pos.xspine = obj.trx(fly).xspine;
            pos.yspine = obj.trx(fly).yspine;
            pos.xhead = obj.trx(fly).xhead;
            pos.yhead = obj.trx(fly).yhead;
            pos.xmid = obj.trx(fly).xmid;
            pos.ymid = obj.trx(fly).ymid;
            pos.xtail = obj.trx(fly).xtail;
            pos.ytail = obj.trx(fly).ytail;
            return;
        end
        
        is = ts + obj.trx(fly).off;
        pos.x = obj.trx(fly).x(is);
        pos.y = obj.trx(fly).y(is);
        pos.theta = obj.trx(fly).theta(is);
        pos.a = obj.trx(fly).a(is);
        pos.b = obj.trx(fly).b(is);
        pos.xcontour = obj.trx(fly).xcontour{is};
        pos.ycontour = obj.trx(fly).ycontour{is};
        pos.xspine = obj.trx(fly).xspine(:,is);
        pos.yspine = obj.trx(fly).yspine(:,is);
        pos.xhead = obj.trx(fly).xhead(is);
        pos.yhead = obj.trx(fly).yhead(is);
        pos.xmid = obj.trx(fly).xmid(is);
        pos.ymid = obj.trx(fly).ymid(is);
        pos.xtail = obj.trx(fly).xtail(is);
        pos.ytail = obj.trx(fly).ytail(is);
        
    case 'larvaspecies',
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = obj.trx(fly).a;
            pos.b = obj.trx(fly).b;
            %pos.xcontour = obj.trx(fly).xcontour;
            %pos.ycontour = obj.trx(fly).ycontour;
            pos.xspine = obj.trx(fly).xspine;
            pos.yspine = obj.trx(fly).yspine;
            return;
        end
        
        is = ts + obj.trx(fly).off;
        pos.x = obj.trx(fly).x(is);
        pos.y = obj.trx(fly).y(is);
        pos.theta = obj.trx(fly).theta(is);
        pos.a = obj.trx(fly).a(is);
        pos.b = obj.trx(fly).b(is);
        %pos.xcontour = obj.trx(fly).xcontour{is};
        %pos.ycontour = obj.trx(fly).ycontour{is};
        pos.xspine = obj.trx(fly).xspine(:,is);
        pos.yspine = obj.trx(fly).yspine(:,is);
        
    case 'center_and_orientation',
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = 10;
            return;
        end
        
        pos.x = obj.trx(fly).x(ts + obj.trx(fly).off);
        pos.y = obj.trx(fly).y(ts + obj.trx(fly).off);
        pos.theta = obj.trx(fly).theta(ts + obj.trx(fly).off);
        pos.a = 10;
        
    case 'wingedfly_and_landmarks',
        
        %skelidx = cat(1,obj.skeleton{:});
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = obj.trx(fly).a;
            pos.b = obj.trx(fly).b;
            pos.xwingl = obj.trx(fly).xwingl;
            pos.ywingl = obj.trx(fly).ywingl;
            pos.xwingr = obj.trx(fly).xwingr;
            pos.ywingr = obj.trx(fly).ywingr;
            pos.xlandmarks = obj.trx(fly).xlandmarks;
            pos.ylandmarks = obj.trx(fly).ylandmarks;
        else
            pos.x = obj.trx(fly).x(ts + obj.trx(fly).off);
            pos.y = obj.trx(fly).y(ts + obj.trx(fly).off);
            pos.theta = obj.trx(fly).theta(ts + obj.trx(fly).off);
            pos.a = obj.trx(fly).a(ts + obj.trx(fly).off);
            pos.b = obj.trx(fly).b(ts + obj.trx(fly).off);
            pos.xwingl = obj.trx(fly).xwingl(ts + obj.trx(fly).off);
            pos.ywingl = obj.trx(fly).ywingl(ts + obj.trx(fly).off);
            pos.xwingr = obj.trx(fly).xwingr(ts + obj.trx(fly).off);
            pos.ywingr = obj.trx(fly).ywingr(ts + obj.trx(fly).off);
            pos.xlandmarks = obj.trx(fly).xlandmarks(:,ts+obj.trx(fly).off);
            pos.ylandmarks = obj.trx(fly).ylandmarks(:,ts+obj.trx(fly).off);
        end
        pos.xskeleton = nan(numel(obj.trx(fly).skeleton_edges),size(pos.xlandmarks,2));
        pos.yskeleton = nan(numel(obj.trx(fly).skeleton_edges),size(pos.xlandmarks,2));
        pos.xskeleton(obj.trx(fly).skeleton_edges~=0,:) = pos.xlandmarks(obj.trx(fly).skeleton_edges(obj.trx(fly).skeleton_edges~=0),:);
        pos.yskeleton(obj.trx(fly).skeleton_edges~=0,:) = pos.ylandmarks(obj.trx(fly).skeleton_edges(obj.trx(fly).skeleton_edges~=0),:);
        
    case 'apt',
        
        if nargin < 4,
            pos.x = obj.trx(fly).x;
            pos.y = obj.trx(fly).y;
            pos.theta = obj.trx(fly).theta;
            pos.a = obj.trx(fly).a;
            pos.b = obj.trx(fly).b;
            return;
            count = 1;
            fields = {'x','y','theta'};
            while isfield(obj.trx,sprintf('x_view%d', count))
                for fndx = 1:numel(fields)
                    cur_f = sprintf('%s_view%d', fields{fndx},count);
                    pos.(cur_f) = obj.trx(fly).(cur_f);
                end
                count = count + 1;
            end
            
        end
        
        pos.x = obj.trx(fly).x(ts + obj.trx(fly).off);
        pos.y = obj.trx(fly).y(ts + obj.trx(fly).off);
        pos.theta = obj.trx(fly).theta(ts + obj.trx(fly).off);
        pos.a = obj.trx(fly).a(ts + obj.trx(fly).off);
        pos.b = obj.trx(fly).b(ts + obj.trx(fly).off);
        
        count = 1;
        fields = {'x','y','theta'};
        while isfield(obj.trx,sprintf('x_view%d', count))
            for fndx = 1:numel(fields)
                cur_f = sprintf('%s_view%d', fields{fndx},count);
                pos.(cur_f) = obj.trx(fly).(cur_f)(ts + obj.trx(fly).off);
            end
            count = count + 1;
        end
        
end

if obj.fromAPT && nargin > 3
    % this seems to be always called with ts. Not including apt trk info if t
    % is not specified. Which shoudln't occur anyway -- MK 20190305
    off = obj.trx(fly).off;
    trk_x = []; trk_y = [];
    for ndx = 1:numel(obj.trx(fly).apt_trk)
        curx = obj.trx(fly).apt_trk{ndx}(:,1,ts + off);
        cury = obj.trx(fly).apt_trk{ndx}(:,2,ts + off);
        trk_x = [trk_x ;curx]; trk_y = [trk_y ;cury];
    end
    pos.trk_x = trk_x; pos.trk_y = trk_y;
end
