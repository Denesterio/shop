<template>
    <div class="card mb-12 m-3">
    <div class="row">
        <div class="col-md-3 position-relative">
        <img
            :src="product.picture
                ? '/storage/' + product.picture
                : '/img/cap.png'"
            :alt="product.title"
            style="max-width: 100%; max-height: 100%;"
            class="d-block position-absolute my-auto"><img>
        </div>
        <div class="col-md-9">
        <div class="card-body">
            <h4>
                {{product.title}}
            </h4>
            <p style="font-size: 1rem">
                {{product.description}}
            </p>
            <p class="card-text">
                <small class="text-muted">
                    {{product.price}} руб.
                </small>
            </p>
        </div>
        </div>
    </div>
    </div>
</template>

<script>

export default {
    props: ['product'],
}
</script>

<style scoped>
</style>