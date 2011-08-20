# this was trancekoded by the awesome trancekoder
# ...and fixifikated by the awesum fixifikator
require 'modshogun'
require 'pp'

traindat = LoadMatrix.load_numbers('../data/fm_train_real.dat')
testdat = LoadMatrix.load_numbers('../data/fm_test_real.dat')

parameter_list = [[traindat,testdat],[traindat,testdat]]

def distance_normsquared_modular(fm_train_real=traindat,fm_test_real=testdat)


# *** 	feats_train=RealFeatures(fm_train_real)
	feats_train=Modshogun::RealFeatures.new
	feats_train.set_features(fm_train_real)
# *** 	feats_test=RealFeatures(fm_test_real)
	feats_test=Modshogun::RealFeatures.new
	feats_test.set_features(fm_test_real)

# *** 	distance=EuclidianDistance(feats_train, feats_train)
	distance=Modshogun::EuclidianDistance.new
	distance.set_features(feats_train, feats_train)
	distance.set_disable_sqrt(True)

	dm_train=distance.get_distance_matrix()
	distance.init(feats_train, feats_test)
	dm_test=distance.get_distance_matrix()

	return distance,dm_train,dm_test


end
if __FILE__ == $0

	puts 'EuclidianDistance - NormSquared'
	distance_normsquared_modular(*parameter_list[0])

end
